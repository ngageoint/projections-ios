//
//  SFPProjection.m
//  sf-ios-proj
//
//  Created by Brian Osborn on 5/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import "SFPProjection.h"

@interface SFPProjection()

/**
 *  Projection authority
 */
@property (nonatomic, strong) NSString *authority;

/**
 *  Coordinate code
 */
@property (nonatomic, strong) NSString *code;

/**
 *  Coordinate Reference System
 */
@property (nonatomic) projPJ crs;

/**
 *  To meters conversion value
 */
@property (nonatomic, strong) NSDecimalNumber *toMeters;

/**
 *  True if a lat lon crs
 */
@property (nonatomic) BOOL isLatLong;

@end

@implementation SFPProjection

-(instancetype) initWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andCrs: (projPJ) crs andToMeters: (NSDecimalNumber *) toMeters{
    return [self initWithAuthority:authority andCode:(code != nil ? [code stringValue] : nil) andCrs:crs andToMeters:toMeters];
}

-(instancetype) initWithAuthority: (NSString *) authority andCode: (NSString *) code andCrs: (projPJ) crs andToMeters: (NSDecimalNumber *) toMeters{
    self = [super init];
    if(self != nil){
        if(authority == nil || code == nil || crs == nil){
            [NSException raise:@"Illegal Arguments" format:@"All projection arguments are required. authority: %@, code: %@, crs: %@", authority, code, crs];
        }
        self.authority = authority;
        self.code = code;
        self.crs = crs;
        self.toMeters = toMeters;
        self.isLatLong = pj_is_latlong(crs);
    }
    return self;
}

-(NSString *) authority{
    return _authority;
}

-(NSString *) code{
    return _code;
}

-(projPJ) crs{
    return _crs;
}

-(NSDecimalNumber *) toMeters{
    return _toMeters;
}

-(BOOL) isLatLong{
    return _isLatLong;
}

-(double) toMeters: (double) value{
    if(self.toMeters != nil){
        NSDecimalNumber * valueDecimalNumber = [[NSDecimalNumber alloc] initWithDouble:value];
        NSDecimalNumber * metersValue = [self.toMeters decimalNumberByMultiplyingBy:valueDecimalNumber];
        value = [metersValue doubleValue];
    }
    return value;
}

-(enum SFPUnit) getUnit{
    
    enum SFPUnit unit = SFP_UNIT_NONE;
    
    if(self.isLatLong){
        unit = SFP_UNIT_DEGREES;
    }else{
        unit = SFP_UNIT_METERS;
    }
    
    return unit;
}

-(BOOL) isUnit: (enum SFPUnit) unit{
    return [self getUnit] == unit;
}

-(BOOL) isEqualToAuthority: (NSString *) authority andNumberCode: (NSNumber *) code{
    return [self isEqualToAuthority:authority andCode:[code stringValue]];
}

-(BOOL) isEqualToAuthority: (NSString *) authority andCode: (NSString *) code{
    return [_authority isEqualToString:authority] && [_code isEqualToString:code];
}

-(BOOL) isEqualToProjection: (SFPProjection *) projection{
    return [self isEqualToAuthority:projection.authority andCode:projection.code];
}

-(BOOL) isEqual: (id) object{
    if(self == object){
        return YES;
    }
    
    if(![object isKindOfClass:[SFPProjection class]]){
        return NO;
    }
    
    return [self isEqualToProjection: (SFPProjection *)object];
}

-(NSUInteger) hash{
    NSUInteger prime = 31;
    NSUInteger result = 1;
    result = prime * result + [_authority hash];
    result = prime * result + [_code hash];
    return result;
}

@end
