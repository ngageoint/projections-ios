//
//  PROJPrimeMeridian.m
//  proj-ios
//
//  Created by Brian Osborn on 8/25/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "PROJPrimeMeridian.h"

@interface PROJPrimeMeridian()

@property (nonatomic) enum PROJPrimeMeridianType type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) double offsetFromGreenwich;

@end

@implementation PROJPrimeMeridian

/**
 * Type to Prime Meridian mapping
 */
static NSMutableDictionary<NSNumber *, PROJPrimeMeridian *> *typePrimeMeridians = nil;

/**
 * Name to Prime Meridian mapping
 */
static NSMutableDictionary<NSString *, PROJPrimeMeridian *> *namePrimeMeridians = nil;

+(void) initialize{
    typePrimeMeridians = [NSMutableDictionary dictionary];
    namePrimeMeridians = [NSMutableDictionary dictionary];
 
    [self initializePrimeMeridian:[self createWithType:PROJ_PM_GREENWICH andName:@"greenwich" andOffset:0]];
    [self initializePrimeMeridian:[self westWithType:PROJ_PM_LISBON andName:@"lisbon" andDegree:9 andMinute:7 andSecond:54.862]];
    [self initializePrimeMeridian:[self eastWithType:PROJ_PM_PARIS andName:@"paris" andDegree:2 andMinute:20 andSecond:14.025]];
    [self initializePrimeMeridian:[self westWithType:PROJ_PM_BOGOTA andName:@"bogota" andDegree:74 andMinute:04 andSecond:51.3]];
    [self initializePrimeMeridian:[self westWithType:PROJ_PM_MADRID andName:@"madrid" andDegree:3 andMinute:41 andSecond:16.58]];
    [self initializePrimeMeridian:[self eastWithType:PROJ_PM_ROME andName:@"rome" andDegree:12 andMinute:27 andSecond:8.4]];
    [self initializePrimeMeridian:[self eastWithType:PROJ_PM_BERN andName:@"bern" andDegree:7 andMinute:26 andSecond:22.5]];
    [self initializePrimeMeridian:[self eastWithType:PROJ_PM_JAKARTA andName:@"jakarta" andDegree:106 andMinute:48 andSecond:27.79]];
    [self initializePrimeMeridian:[self westWithType:PROJ_PM_FERRO andName:@"ferro" andDegree:17 andMinute:40 andSecond:0]];
    [self initializePrimeMeridian:[self eastWithType:PROJ_PM_BRUSSELS andName:@"brussels" andDegree:4 andMinute:22 andSecond:4.71]];
    [self initializePrimeMeridian:[self eastWithType:PROJ_PM_STOCKHOLM andName:@"stockholm" andDegree:18 andMinute:3 andSecond:29.8]];
    [self initializePrimeMeridian:[self eastWithType:PROJ_PM_ATHENS andName:@"athens" andDegree:23 andMinute:42 andSecond:58.815]];
    [self initializePrimeMeridian:[self eastWithType:PROJ_PM_OSLO andName:@"oslo" andDegree:10 andMinute:43 andSecond:22.5]];
    
}

+(void) initializePrimeMeridian: (PROJPrimeMeridian *) primeMeridian{
    
    [typePrimeMeridians setObject:primeMeridian forKey:[NSNumber numberWithInt:primeMeridian.type]];
    [namePrimeMeridians setObject:primeMeridian forKey:[primeMeridian.name lowercaseString]];

}

+(PROJPrimeMeridian *) eastWithType: (enum PROJPrimeMeridianType) type andName: (NSString *) name andDegree: (double) deg andMinute: (double) min andSecond: (double) sec{
    double longitude = ((sec / 60. + min) / 60. + deg) * (M_PI / 180.0);
    return [self createWithType:type andName:name andOffset:longitude];
}

+(PROJPrimeMeridian *) westWithType: (enum PROJPrimeMeridianType) type andName: (NSString *) name andDegree: (double) deg andMinute: (double) min andSecond: (double) sec{
    return [self eastWithType:type andName:name andDegree:-deg andMinute:-min andSecond:-sec];
}

+(PROJPrimeMeridian *) createWithType: (enum PROJPrimeMeridianType) type andName: (NSString *) name andOffset: (double) offsetFromGreenwich{
    return [[PROJPrimeMeridian alloc] initWithType:type andName:name andOffset:offsetFromGreenwich];
}

+(PROJPrimeMeridian *) fromType: (enum PROJPrimeMeridianType) type{
    return [typePrimeMeridians objectForKey:[NSNumber numberWithInt:type]];
}

+(PROJPrimeMeridian *) fromName: (NSString *) name{
    return [namePrimeMeridians objectForKey:[name lowercaseString]];
}

-(instancetype) initWithType: (enum PROJPrimeMeridianType) type andName: (NSString *) name andOffset: (double) offsetFromGreenwich{
    self = [super init];
    if(self != nil){
        _type = type;
        _name = name;
        _offsetFromGreenwich = offsetFromGreenwich;
    }
    return self;
}

-(enum PROJPrimeMeridianType) type{
    return _type;
}

-(NSString *) name{
    return _name;
}

-(double) offsetFromGreenwich{
    return _offsetFromGreenwich;
}

-(BOOL) isEqualToPrimeMeridian: (PROJPrimeMeridian *) primeMeridian{
    return _offsetFromGreenwich == primeMeridian.offsetFromGreenwich;
}

-(NSString *) description{
    return [NSString stringWithFormat:@"%@:%f", [self name], [self offsetFromGreenwich]];
}

-(BOOL) isEqual: (id) object{
    if(self == object){
        return YES;
    }
    
    if(![object isKindOfClass:[PROJPrimeMeridian class]]){
        return NO;
    }
    
    PROJPrimeMeridian *primeMeridian = (PROJPrimeMeridian *) object;
    if(_type != primeMeridian.type){
        return NO;
    }
    if(_name == nil){
        if (primeMeridian.name != nil){
            return NO;
        }
    }else if(![_name isEqualToString:primeMeridian.name]){
        return NO;
    }
    if(![[NSNumber numberWithDouble:_offsetFromGreenwich] isEqual:[NSNumber numberWithDouble:primeMeridian.offsetFromGreenwich]]){
        return NO;
    }
    return YES;
}

-(NSUInteger) hash{
    NSUInteger prime = 31;
    NSUInteger result = 1;
    result = prime * result + [[NSNumber numberWithInt:_type] hash];
    result = prime * result + [_name hash];
    result = prime * result + [[NSNumber numberWithDouble:_offsetFromGreenwich] hash];
    return result;
}

@end
