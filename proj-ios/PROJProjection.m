//
//  PROJProjection.m
//  proj-ios
//
//  Created by Brian Osborn on 5/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import "PROJProjection.h"

@interface PROJProjection()

/**
 *  Projection authority
 */
@property (nonatomic, strong) NSString *authority;

/**
 *  Coordinate code
 */
@property (nonatomic, strong) NSString *code;

/**
 *  Projection Coordinate Reference System
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

/**
 *  Well-Known Text Coordinate Definition
 */
@property (nonatomic, strong) NSString *definition;

/**
 * Definition parsed Coordinate Reference System
 */
// TODO @property (nonatomic, strong) CRSObject *definitionCRS;

@end

@implementation PROJProjection

-(instancetype) initWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andCrs: (projPJ) crs andToMeters: (NSDecimalNumber *) toMeters{
    return [self initWithAuthority:authority andNumberCode:code andCrs:crs andToMeters:toMeters andDefinition:nil];
}

-(instancetype) initWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (projPJ) crs
                      andToMeters: (NSDecimalNumber *) toMeters{
    return [self initWithAuthority:authority andCode:code andCrs:crs andToMeters:toMeters andDefinition:nil];
}

-(instancetype) initWithAuthority: (NSString *) authority
                    andNumberCode: (NSNumber *) code
                           andCrs: (projPJ) crs
                      andToMeters: (NSDecimalNumber *) toMeters
                    andDefinition: (NSString *) definition{
    return [self initWithAuthority:authority andCode:(code != nil ? [code stringValue] : nil) andCrs:crs andToMeters:toMeters andDefinition:definition];
}

-(instancetype) initWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (projPJ) crs
                      andToMeters: (NSDecimalNumber *) toMeters
                    andDefinition: (NSString *) definition{
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
        self.definition = definition;
        // TODO CRSObject
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

-(NSString *) definition{
    return _definition;
}

// TODO
//-(CRSObject *) definitionCRS{
//    return _definitionCRS;
//}

-(double) toMeters: (double) value{
    if(self.toMeters != nil){
        NSDecimalNumber * valueDecimalNumber = [[NSDecimalNumber alloc] initWithDouble:value];
        NSDecimalNumber * metersValue = [self.toMeters decimalNumberByMultiplyingBy:valueDecimalNumber];
        value = [metersValue doubleValue];
    }
    return value;
}

-(enum PROJUnit) getUnit{
    
    enum PROJUnit unit = PROJ_UNIT_NONE;
    
    if(self.isLatLong){
        unit = PROJ_UNIT_DEGREES;
    }else{
        unit = PROJ_UNIT_METERS;
    }
    
    return unit;
}

-(BOOL) isUnit: (enum PROJUnit) unit{
    return [self getUnit] == unit;
}

-(BOOL) isEqualToAuthority: (NSString *) authority andNumberCode: (NSNumber *) code{
    return [self isEqualToAuthority:authority andCode:[code stringValue]];
}

-(BOOL) isEqualToAuthority: (NSString *) authority andCode: (NSString *) code{
    return [_authority isEqualToString:authority] && [_code isEqualToString:code];
}

-(BOOL) isEqualToProjection: (PROJProjection *) projection{
    return [self isEqualToAuthority:projection.authority andCode:projection.code];
}

-(BOOL) isEqual: (id) object{
    if(self == object){
        return YES;
    }
    
    if(![object isKindOfClass:[PROJProjection class]]){
        return NO;
    }
    
    return [self isEqualToProjection: (PROJProjection *)object];
}

-(NSUInteger) hash{
    NSUInteger prime = 31;
    NSUInteger result = 1;
    result = prime * result + [_authority hash];
    result = prime * result + [_code hash];
    return result;
}

-(NSString *) description{
    return [NSString stringWithFormat:@"%@:%@", _authority, _code];
}

@end
