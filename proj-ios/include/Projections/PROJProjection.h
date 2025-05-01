//
//  PROJProjection.h
//  proj-ios
//
//  Created by Brian Osborn on 5/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import <Projections/PROJUnits.h>
#import <Projections/PROJProjectionTransform.h>

// Forward declarations
struct PJconsts;
typedef struct PJconsts PJ;
@class CRSObject;

/**
 *  Single Projection for an authority and code
 */
@interface PROJProjection : NSObject

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *
 *  @return new projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                    andNumberCode: (NSNumber *) code
                           andCrs: (PJ *) crs;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *
 *  @return new projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                    andIntCode: (int) code
                           andCrs: (PJ *) crs;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *
 *  @return new projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (PJ *) crs;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *
 *  @return new projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                    andNumberCode: (NSNumber *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *
 *  @return new projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                    andIntCode: (int) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *
 *  @return new projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *  @param params    PROJ parameters
 *
 *  @return new projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (PJ *) crs
                          andDefinition: (NSString *) definition
                            andParams: (NSString *) params;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *  @param definitionCRS definition parsed coordinate reference system
 *
 *  @return new projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                    andNumberCode: (NSNumber *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition
                 andDefinitionCrs: (CRSObject *) definitionCRS;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *  @param definitionCRS definition parsed coordinate reference system
 *
 *  @return new projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                    andIntCode: (int) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition
                 andDefinitionCrs: (CRSObject *) definitionCRS;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *  @param definitionCRS definition parsed coordinate reference system
 *
 *  @return new projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition
                 andDefinitionCrs: (CRSObject *) definitionCRS;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *
 *  @return new projection
 */
-(instancetype) initWithAuthority: (NSString *) authority
                    andNumberCode: (NSNumber *) code
                           andCrs: (PJ *) crs;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *
 *  @return new projection
 */
-(instancetype) initWithAuthority: (NSString *) authority
                    andIntCode: (int) code
                           andCrs: (PJ *) crs;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *
 *  @return new projection
 */
-(instancetype) initWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (PJ *) crs;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *
 *  @return new projection
 */
-(instancetype) initWithAuthority: (NSString *) authority
                    andNumberCode: (NSNumber *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *
 *  @return new projection
 */
-(instancetype) initWithAuthority: (NSString *) authority
                    andIntCode: (int) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *
 *  @return new projection
 */
-(instancetype) initWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *  @param params    PROJ parameters
 *
 *  @return new projection
 */
-(instancetype) initWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition
                        andParams: (NSString *) params;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *  @param definitionCRS definition parsed coordinate reference system
 *
 *  @return new projection
 */
-(instancetype) initWithAuthority: (NSString *) authority
                    andNumberCode: (NSNumber *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition
                 andDefinitionCrs: (CRSObject *) definitionCRS;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *  @param definitionCRS definition parsed coordinate reference system
 *
 *  @return new projection
 */
-(instancetype) initWithAuthority: (NSString *) authority
                    andIntCode: (int) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition
                 andDefinitionCrs: (CRSObject *) definitionCRS;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *  @param definitionCRS definition parsed coordinate reference system
 *
 *  @return new projection
 */
-(instancetype) initWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition
                 andDefinitionCrs: (CRSObject *) definitionCRS;

/**
 *  Initialize
 *
 *  @param authority coordinate authority
 *  @param code      coordinate code
 *  @param crs       coordinate reference system
 *  @param definition  well-known text coordinate definition
 *  @param definitionCRS definition parsed coordinate reference system
 *  @param params    PROJ parameters
 *
 *  @return new projection
 */
-(instancetype) initWithAuthority: (NSString *) authority
                          andCode: (NSString *) code
                           andCrs: (PJ *) crs
                    andDefinition: (NSString *) definition
                 andDefinitionCrs: (CRSObject *) definitionCRS
                        andParams: (NSString *) params;

/**
 * Destroy the projection memory
 */
-(void) free;

/**
 * Destroy the projection memory
 */
-(void) close;

/**
 * Destroy the projection memory
 */
-(void) destroy;

/**
 * Get the coordinate authority
 *
 * @return authority
 */
-(NSString *) authority;

/**
 * Get the coordinate code
 *
 * @return code
 */
-(NSString *) code;

/**
 * Get the Coordinate Reference System
 *
 * @return coordinate reference system
 */
-(PJ *) crs;

/**
 * Get the well-known text coordinate definition
 *
 * @return definition
 */
-(NSString *) definition;

/**
 * Get the definition parsed Coordinate Reference System
 *
 * @return coordinate reference system
 */
-(CRSObject *) definitionCRS;

/**
 * Get the PROJ params
 *
 * @return params
 */
-(NSString *) params;

/**
 * Get the transformation from this Projection to the EPSG code. Each thread
 * of execution should have it's own transformation.
 *
 * @param epsg
 *            epsg
 * @return transform
 */
-(PROJProjectionTransform *) transformationWithEpsg: (int) epsg;

/**
 * Get the transformation from this Projection to the authority and
 * coordinate code. Each thread of execution should have it's own
 * transformation.
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            coordinate code
 * @return transform
 */
-(PROJProjectionTransform *) transformationWithAuthority: (NSString *) authority andIntCode: (int) code;

/**
 * Get the transformation from this Projection to the authority and
 * coordinate code. Each thread of execution should have it's own
 * transformation.
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            coordinate code
 * @return transform
 */
-(PROJProjectionTransform *) transformationWithAuthority: (NSString *) authority andCode: (NSString *) code;

/**
 * Get the transformation from this Projection to the provided projection.
 * Each thread of execution should have it's own transformation.
 *
 * @param projection
 *            projection
 * @return transform
 */
-(PROJProjectionTransform *) transformationWithProjection: (PROJProjection *) projection;

/**
 *  Get the projection unit
 *
 *  @return unit
 */
-(enum PROJUnit) unit;

/**
 * Determine if the projection is in the provided unit
 *
 * @param unit
 *            unit
 * @return true if in the provided unit
 */
-(BOOL) isUnit: (enum PROJUnit) unit;

/**
 * Check if this projection is equal to the authority and code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            coordinate code
 * @return true if equal
 */
-(BOOL) isEqualToAuthority: (NSString *) authority andNumberCode: (NSNumber *) code;

/**
 * Check if this projection is equal to the authority and code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            coordinate code
 * @return true if equal
 */
-(BOOL) isEqualToAuthority: (NSString *) authority andCode: (NSString *) code;

/**
 * Check if this projection is equal to the projection
 *
 * @param projection
 *            projection
 * @return true if equal
 */
-(BOOL) isEqualToProjection: (PROJProjection *) projection;

@end
