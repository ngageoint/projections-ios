//
//  PROJProjection.m
//  proj-ios
//
//  Created by Brian Osborn on 5/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import "PROJProjection.h"
#import "PROJProjectionConstants.h"
#import "PROJProjectionFactory.h"

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
@property (nonatomic) PJ *crs;

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
@property (nonatomic, strong) CRSObject *definitionCRS;

@end

@implementation PROJProjection

+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                    andNumberCode: (NSNumber *) code
                                 andCrs: (PJ *) crs{
    return [[PROJProjection alloc] initWithAuthority:authority andNumberCode:code andCrs:crs];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                    andIntCode: (int) code
                                     andCrs: (PJ *) crs{
    return [[PROJProjection alloc] initWithAuthority:authority andIntCode:code andCrs:crs];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                                 andCrs: (PJ *) crs{
    return [[PROJProjection alloc] initWithAuthority:authority andCode:code andCrs:crs];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                    andNumberCode: (NSNumber *) code
                           andCrs: (PJ *) crs
                          andDefinition: (NSString *) definition{
    return [[PROJProjection alloc] initWithAuthority:authority andNumberCode:code andCrs:crs andDefinition:definition];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                    andIntCode: (int) code
                           andCrs: (PJ *) crs
                              andDefinition: (NSString *) definition{
    return [[PROJProjection alloc] initWithAuthority:authority andIntCode:code andCrs:crs andDefinition:definition];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (PJ *) crs
                          andDefinition: (NSString *) definition{
    return [[PROJProjection alloc] initWithAuthority:authority andCode:code andCrs:crs andDefinition:definition];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                    andNumberCode: (NSNumber *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition
                       andDefinitionCrs: (CRSObject *) definitionCRS{
    return [[PROJProjection alloc] initWithAuthority:authority andNumberCode:code andCrs:crs andDefinition:definition andDefinitionCrs:definitionCRS];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                    andIntCode: (int) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition
                           andDefinitionCrs: (CRSObject *) definitionCRS{
    return [[PROJProjection alloc] initWithAuthority:authority andIntCode:code andCrs:crs andDefinition:definition andDefinitionCrs:definitionCRS];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition
                       andDefinitionCrs: (CRSObject *) definitionCRS{
    return [[PROJProjection alloc] initWithAuthority:authority andCode:code andCrs:crs andDefinition:definition andDefinitionCrs:definitionCRS];
}

-(instancetype) initWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andCrs: (PJ *) crs{
    return [self initWithAuthority:authority andNumberCode:code andCrs:crs andDefinition:nil];
}

-(instancetype) initWithAuthority: (NSString *) authority
                    andIntCode: (int) code
                           andCrs: (PJ *) crs{
    return [self initWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code] andCrs:crs];
}

-(instancetype) initWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (PJ *) crs{
    return [self initWithAuthority:authority andCode:code andCrs:crs andDefinition:nil];
}

-(instancetype) initWithAuthority: (NSString *) authority
                    andNumberCode: (NSNumber *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition{
    return [self initWithAuthority:authority andNumberCode:code andCrs:crs andDefinition:definition andDefinitionCrs:nil];
}

-(instancetype) initWithAuthority: (NSString *) authority
                    andIntCode: (int) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition{
    return [self initWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code] andCrs:crs andDefinition:definition];
}

-(instancetype) initWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition{
    return [self initWithAuthority:authority andCode:code andCrs:crs andDefinition:definition andDefinitionCrs:nil];
}

-(instancetype) initWithAuthority: (NSString *) authority
                    andNumberCode: (NSNumber *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition
                 andDefinitionCrs: (CRSObject *) definitionCRS{
    return [self initWithAuthority:authority andCode:(code != nil ? [code stringValue] : nil) andCrs:crs andDefinition:definition andDefinitionCrs:definitionCRS];
}

-(instancetype) initWithAuthority: (NSString *) authority
                    andIntCode: (int) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition
                 andDefinitionCrs: (CRSObject *) definitionCRS{
    return [self initWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code] andCrs:crs andDefinition:definition andDefinitionCrs:definitionCRS];
}

-(instancetype) initWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition
                 andDefinitionCrs: (CRSObject *) definitionCRS{
    self = [super init];
    if(self != nil){
        if(authority == nil || code == nil || crs == nil){
            [NSException raise:@"Illegal Arguments" format:@"All projection arguments are required. authority: %@, code: %@, crs: %@", authority, code, crs];
        }
        _authority = authority;
        _code = code;
        _crs = crs;
        PJ_PROJ_INFO info = proj_pj_info(crs);
        _isLatLong = info.id != NULL && [[NSString stringWithUTF8String:info.id] isEqualToString:@"longlat"];
        _definition = definition;
        _definitionCRS = definitionCRS;
    }
    return self;
}

-(void) free{
    if(_crs != NULL){
        proj_destroy(_crs);
        _crs = NULL;
    }
}

-(NSString *) authority{
    return _authority;
}

-(NSString *) code{
    return _code;
}

-(PJ *) crs{
    return _crs;
}

-(BOOL) isLatLong{
    return _isLatLong;
}

-(NSString *) definition{
    return _definition;
}

-(CRSObject *) definitionCRS{
    return _definitionCRS;
}

-(PROJProjectionTransform *) transformationWithEpsg: (int) epsg{
    return [self transformationWithAuthority:PROJ_AUTHORITY_EPSG andIntCode:epsg];
}

-(PROJProjectionTransform *) transformationWithAuthority: (NSString *) authority andIntCode: (int) code{
    PROJProjection *projectionTo = [PROJProjectionFactory projectionWithAuthority:authority andIntCode:code];
    return [self transformationWithProjection:projectionTo];
}

-(PROJProjectionTransform *) transformationWithAuthority: (NSString *) authority andCode: (NSString *) code{
    PROJProjection *projectionTo = [PROJProjectionFactory projectionWithAuthority:authority andCode:code];
    return [self transformationWithProjection:projectionTo];
}

-(PROJProjectionTransform *) transformationWithProjection: (PROJProjection *) projection{
    return [PROJProjectionTransform transformFromProjection:self andToProjection:projection];
}

-(enum PROJUnit) unit{
    
    enum PROJUnit unit = PROJ_UNIT_NONE;
    
    if(_isLatLong){
        unit = PROJ_UNIT_DEGREES;
    }else{
        unit = PROJ_UNIT_METERS;
    }
    
    return unit;
}

-(BOOL) isUnit: (enum PROJUnit) unit{
    return [self unit] == unit;
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
