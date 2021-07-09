//
//  SFTestUtils.m
//  sf-proj-ios
//
//  Created by Brian Osborn on 6/12/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import "SFPTestUtils.h"

#define ARC4RANDOM_MAX      0x100000000

@implementation SFPTestUtils

+(void)assertNil:(id) value{
    if(value != nil){
        [NSException raise:@"Assert Nil" format:@"Value is not nil: %@", value];
    }
}

+(void)assertNotNil:(id) value{
    if(value == nil){
        [NSException raise:@"Assert Not Nil" format:@"Value is nil: %@", value];
    }
}

+(void)assertTrue: (BOOL) value{
    if(!value){
        [NSException raise:@"Assert True" format:@"Value is false"];
    }
}

+(void)assertFalse: (BOOL) value{
    if(value){
        [NSException raise:@"Assert False" format:@"Value is true"];
    }
}

+(void)assertEqualWithValue:(NSObject *) value andValue2: (NSObject *) value2{
    if(value == nil){
        if(value2 != nil){
            [NSException raise:@"Assert Equal" format:@"Value 1: '%@' is not equal to Value 2: '%@'", value, value2];
        }
    } else if(![value isEqual:value2]){
        [NSException raise:@"Assert Equal" format:@"Value 1: '%@' is not equal to Value 2: '%@'", value, value2];
    }
}

+(void)assertEqualDecimalNumberWithValue:(NSDecimalNumber *) value andValue2: (NSDecimalNumber *) value2 andDelta: (double) delta{
    if(value == nil){
        if(value2 != nil){
            [NSException raise:@"Assert Decimal Number Equal" format:@"Value 1: '%@' is not equal to Value 2: '%@'", value, value2];
        }
    } else{
        [self assertEqualDoubleWithValue:[value doubleValue] andValue2:[value2 doubleValue] andDelta:delta];
    }
}

+(void)assertEqualBoolWithValue:(BOOL) value andValue2: (BOOL) value2{
    if(value != value2){
        [NSException raise:@"Assert Equal BOOL" format:@"Value 1: '%d' is not equal to Value 2: '%d'", value, value2];
    }
}

+(void)assertEqualIntWithValue:(int) value andValue2: (int) value2{
    if(value != value2){
        [NSException raise:@"Assert Equal int" format:@"Value 1: '%d' is not equal to Value 2: '%d'", value, value2];
    }
}

+(void)assertEqualDoubleWithValue:(double) value andValue2: (double) value2{
    if(value != value2){
        [NSException raise:@"Assert Equal double" format:@"Value 1: '%f' is not equal to Value 2: '%f'", value, value2];
    }
}

+(void)assertEqualDoubleWithValue:(double) value andValue2: (double) value2 andDelta: (double) delta{
    if(fabsl(value - value2) > delta){
        [NSException raise:@"Assert Equal double" format:@"Value 1: '%f' is not equal to Value 2: '%f' within delta: '%f'", value, value2, delta];
    }
}

+(BOOL) equalDoubleWithValue:(double) value andValue2: (double) value2 andDelta: (double) delta{
    return fabsl(value - value2) <= delta;
}

+(void)assertEqualDoubleWithValue:(double) value andValue2: (double) value2 andPercentage: (double) percentage{
    if(fabsl(value - value2) > percentage * MAX(fabsl(value), fabsl(value2))){
        [NSException raise:@"Assert Equal double" format:@"Value 1: '%f' is not equal to Value 2: '%f' within percentage: '%f'", value, value2, percentage];
    }
}

+(void)assertEqualDataWithValue:(NSData *) value andValue2: (NSData *) value2{
    if(value == nil){
        if(value2 != nil){
            [NSException raise:@"Assert Data Equal" format:@"Value 1: '%@' is not equal to Value 2: '%@'", value, value2];
        }
    } else if(![value isEqualToData:value2]){
        [NSException raise:@"Assert Data Equal" format:@"Value 1: '%@' is not equal to Value 2: '%@'", value, value2];
    }
}

+(void)fail:(NSString *) message{
    [NSException raise:@"Test Failure" format:@"%@", message];
}

+(SFPoint *) createPointWithHasZ: (BOOL) hasZ andHasM: (BOOL) hasM{
    
    double x = [self randomDoubleLessThan:180.0] * ([self randomDouble] < .5 ? 1 : -1);
    double y = [self randomDoubleLessThan:90.0] * ([self randomDouble] < .5 ? 1 : -1);
    
    NSDecimalNumber * xNumber = [self roundDouble:x];
    NSDecimalNumber * yNumber = [self roundDouble:y];
    
    SFPoint * point = [[SFPoint alloc] initWithHasZ:hasZ andHasM:hasM andX:xNumber andY:yNumber];
    
    if(hasZ){
        double z = [self randomDoubleLessThan:1000.0];
        NSDecimalNumber * zNumber = [self roundDouble:z];
        [point setZ:zNumber];
    }
    
    if(hasM){
        double m = [self randomDoubleLessThan:1000.0];
        NSDecimalNumber * mNumber = [self roundDouble:m];
        [point setM:mNumber];
    }
       
       return point;
}

+(SFLineString *) createLineStringWithHasZ: (BOOL) hasZ andHasM: (BOOL) hasM andRing: (BOOL) ring{
    
    SFLineString * lineString = [[SFLineString alloc] initWithHasZ:hasZ andHasM:hasM];
    
    int numPoints = 2 + [self randomIntLessThan:9];
    
    for(int i = 0; i < numPoints; i++){
        [lineString addPoint:[self createPointWithHasZ:hasZ andHasM:hasM]];
    }
    
    if(ring){
        [lineString addPoint:[lineString.points objectAtIndex:0]];
    }
    
    return lineString;
}

+(SFPolygon *) createPolygonWithHasZ: (BOOL) hasZ andHasM: (BOOL) hasM{
    
    SFPolygon * polygon = [[SFPolygon alloc] initWithHasZ:hasZ andHasM:hasM];
    
    int numLineStrings = 1 + [self randomIntLessThan:5];
    
    for(int i = 0; i < numLineStrings; i++){
        [polygon addRing:[self createLineStringWithHasZ:hasZ andHasM:hasM andRing:true]];
    }
    
    return polygon;
}

+(NSDecimalNumber *) roundDouble: (double) value{
    return [self roundDouble:value withScale:1];
}

+(NSDecimalNumber *) roundDouble: (double) value withScale: (int) scale{
    NSDecimalNumberHandler *rounder = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    return [[[NSDecimalNumber alloc] initWithDouble:value] decimalNumberByRoundingAccordingToBehavior:rounder];
}

+(int) randomIntLessThan: (int) max{
    return arc4random() % max;
}

+(double) randomDouble{
    return ((double)arc4random() / ARC4RANDOM_MAX);
}

+(double) randomDoubleLessThan: (double) max{
    return [self randomDouble] * max;
}

@end
