//
//  PROJProjectionFactory.h
//  proj-ios
//
//  Created by Brian Osborn on 5/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import <Projections/PROJProjections.h>
#import <Projections/PROJProjectionFactoryTypes.h>

/**
 *  Projection factory for coordinate projections and transformations
 */
@interface PROJProjectionFactory : NSObject

/**
 * Reset the projection factory retrieval order to the default
 */
+(void) resetOrder;

/**
 * Get a copy of the projection factory retrieval order
 *
 * @return order set copy
 */
+(NSOrderedSet<NSNumber *> *) order;

/**
 * Get a copy of the projection factory retrieval order without caching
 *
 * @return order set copy without cache
 */
+(NSOrderedSet<NSNumber *> *) cachelessOrder;

/**
 * Remove the projection factory retrieval type from the retrieval ordering
 *
 * @param type
 *            retrieval type
 */
+(void) removeOrderType: (PROJProjectionFactoryType) type;

/**
 * Set the projection factory retrieval order
 *
 * @param types
 *            factory retrieval types
 */
+(void) setOrder: (NSOrderedSet<NSNumber *> *) types;

/**
 * Build a default order set for specified ordered projection retrievals
 * without changing the global ordering
 *
 * @return projection factory retrieval order
 */
+(NSOrderedSet<NSNumber *> *) buildDefaultOrder;

/**
 * Build an order set for specified ordered projection retrievals without
 * changing the global ordering
 *
 * @param types
 *            factory retrieval types
 * @return projection factory retrieval order
 */
+(NSOrderedSet<NSNumber *> *) buildOrder: (NSOrderedSet<NSNumber *> *) types;

/**
 * Get the projection for the EPSG code
 *
 * @param epsg
 *            EPSG coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithEpsg: (NSNumber *) epsg;

/**
 * Get the cacheless projection for the EPSG code
 *
 * @param epsg
 *            EPSG coordinate code
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithEpsg: (NSNumber *) epsg;

/**
 * Get the projection for the EPSG code
 *
 * @param type
 *            projection factory retrieval type
 * @param epsg
 *            EPSG coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andEpsg: (NSNumber *) epsg;

/**
 * Get the projection for the EPSG code
 *
 * @param types
 *            projection factory retrieval types
 * @param epsg
 *            EPSG coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andEpsg: (NSNumber *) epsg;

/**
 * Get the projection for the EPSG code
 *
 * @param epsg
 *            EPSG coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithEpsgInt: (int) epsg;

/**
 * Get the cacheless projection for the EPSG code
 *
 * @param epsg
 *            EPSG coordinate code
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithEpsgInt: (int) epsg;

/**
 * Get the projection for the EPSG code
 *
 * @param type
 *            projection factory retrieval type
 * @param epsg
 *            EPSG coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andEpsgInt: (int) epsg;

/**
 * Get the projection for the EPSG code
 *
 * @param types
 *            projection factory retrieval types
 * @param epsg
 *            EPSG coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andEpsgInt: (int) epsg;

/**
 *  Get the projection for the projection name, expected as 'authority:code' or 'epsg_code'
 *
 *  @param name projection name
 *
 *  @return projection
 */
+(PROJProjection *) projectionWithName: (NSString *) name;

/**
 * Get the cacheless projection for the projection name, expected as 'authority:code' or 'epsg_code'
 *
 * @param name
 *            projection name
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithName: (NSString *) name;

/**
 *  Get the projection for the projection name, expected as 'authority:code' or 'epsg_code'
 *
 *  @param type
 *            projection factory retrieval type
 *  @param name projection name
 *
 *  @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andName: (NSString *) name;

/**
 *  Get the projection for the projection name, expected as 'authority:code' or 'epsg_code'
 *
 *  @param types
 *            projection factory retrieval types
 *  @param name projection name
 *
 *  @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andName: (NSString *) name;

/**
 * Get the projection for authority and code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code;

/**
 * Get the cacheless projection for authority and code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code;

/**
 * Get the projection for authority and code
 *
 * @param type
 *            projection factory retrieval type
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andAuthority: (NSString *) authority andNumberCode: (NSNumber *) code;

/**
 * Get the projection for authority and code
 *
 * @param types
 *            projection factory retrieval types
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andAuthority: (NSString *) authority andNumberCode: (NSNumber *) code;

/**
 * Get the projection for authority and code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority andIntCode: (int) code;

/**
 * Get the cacheless projection for authority and code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andIntCode: (int) code;

/**
 * Get the projection for authority and code
 *
 * @param type
 *            projection factory retrieval type
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andAuthority: (NSString *) authority andIntCode: (int) code;

/**
 * Get the projection for authority and code
 *
 * @param types
 *            projection factory retrieval types
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andAuthority: (NSString *) authority andIntCode: (int) code;

/**
 * Get the projection for authority and code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority andCode: (NSString *) code;

/**
 * Get the cacheless projection for authority and code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andCode: (NSString *) code;

/**
 * Get the projection for authority and code
 *
 * @param type
 *            projection factory retrieval type
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andAuthority: (NSString *) authority andCode: (NSString *) code;

/**
 * Get the projection for authority and code
 *
 * @param types
 *            projection factory retrieval types
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andAuthority: (NSString *) authority andCode: (NSString *) code;

/**
 * Get the projection for authority, code, and parameter string
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @return projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andParams: (NSString *) params;

/**
 * Get the cacheless projection for authority, code, and parameter string
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andParams: (NSString *) params;

/**
 * Get the projection for authority, code, and parameter string
 *
 * @param type
 *            projection factory retrieval type
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andParams: (NSString *) params;

/**
 * Get the projection for authority, code, and parameter string
 *
 * @param types
 *            projection factory retrieval types
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andParams: (NSString *) params;

/**
 * Get the projection for authority, code, and parameter string
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @return projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority andIntCode: (int) code andParams: (NSString *) params;

/**
 * Get the cacheless projection for authority, code, and parameter string
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andIntCode: (int) code andParams: (NSString *) params;

/**
 * Get the projection for authority, code, and parameter string
 *
 * @param type
 *            projection factory retrieval type
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andAuthority: (NSString *) authority andIntCode: (int) code andParams: (NSString *) params;

/**
 * Get the projection for authority, code, and parameter string
 *
 * @param types
 *            projection factory retrieval types
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andAuthority: (NSString *) authority andIntCode: (int) code andParams: (NSString *) params;

/**
 * Get the projection for authority, code, and parameter string
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @return projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params;

/**
 * Get the cacheless projection for authority, code, and parameter string
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params;

/**
 * Get the projection for authority, code, and parameter string
 *
 * @param type
 *            projection factory retrieval type
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params;

/**
 * Get the projection for authority, code, and parameter string
 *
 * @param types
 *            projection factory retrieval types
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params;

/**
 * Get the projection for the authority, code, and definition
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andDefinition: (NSString *) definition;

/**
 * Get the cacheless projection for the authority, code, and definition
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, and definition
 *
 * @param type
 *            projection factory retrieval type
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, and definition
 *
 * @param types
 *            projection factory retrieval types
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, and definition
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority andIntCode: (int) code andDefinition: (NSString *) definition;

/**
 * Get the cacheless projection for the authority, code, and definition
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andIntCode: (int) code andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, and definition
 *
 * @param type
 *            projection factory retrieval type
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andAuthority: (NSString *) authority andIntCode: (int) code andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, and definition
 *
 * @param types
 *            projection factory retrieval types
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andAuthority: (NSString *) authority andIntCode: (int) code andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, and definition
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority andCode: (NSString *) code andDefinition: (NSString *) definition;

/**
 * Get the cacheless projection for the authority, code, and definition
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andCode: (NSString *) code andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, and definition
 *
 * @param type
 *            projection factory retrieval type
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andAuthority: (NSString *) authority andCode: (NSString *) code andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, and definition
 *
 * @param types
 *            projection factory retrieval types
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andAuthority: (NSString *) authority andCode: (NSString *) code andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, definition, and custom
 * parameter array
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andParams: (NSString *) params andDefinition: (NSString *) definition;

/**
 * Get the cacheless projection for the authority, code, definition, and custom
 * parameter array
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andParams: (NSString *) params andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, definition, and custom
 * parameter array
 *
 * @param type
 *            projection factory retrieval type
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andParams: (NSString *) params andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, definition, and custom
 * parameter array
 *
 * @param types
 *            projection factory retrieval types
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andParams: (NSString *) params andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, definition, and custom
 * parameter array
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority andIntCode: (int) code andParams: (NSString *) params andDefinition: (NSString *) definition;

/**
 * Get the cacheless projection for the authority, code, definition, and custom
 * parameter array
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andIntCode: (int) code andParams: (NSString *) params andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, definition, and custom
 * parameter array
 *
 * @param type
 *            projection factory retrieval type
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andAuthority: (NSString *) authority andIntCode: (int) code andParams: (NSString *) params andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, definition, and custom
 * parameter array
 *
 * @param types
 *            projection factory retrieval types
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andAuthority: (NSString *) authority andIntCode: (int) code andParams: (NSString *) params andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, definition, and custom
 * parameter array
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params andDefinition: (NSString *) definition;

/**
 * Get the cacheless projection for the authority, code, definition, and custom
 * parameter array
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 string
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, definition, and custom
 * parameter array
 *
 * @param types
 *            projection factory retrieval types
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 params array
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params andDefinition: (NSString *) definition;

/**
 * Get the projection for the authority, code, definition, and custom
 * parameter array
 *
 * @param type
 *            projection factory retrieval type
 * @param authority
 *            coordinate authority
 * @param code
 *            authority coordinate code
 * @param params
 *            proj4 params array
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionWithType: (PROJProjectionFactoryType) type andAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params andDefinition: (NSString *) definition;

/**
 * Get the projection for the definition
 *
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionByDefinition: (NSString *) definition;

/**
 * Get the cacheless projection for the definition
 *
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) cachelessProjectionByDefinition: (NSString *) definition;

/**
 * Get the projections
 *
 * @return projections
 */
+(PROJProjections *) projections;

/**
 * Get or create projections for the authority
 *
 * @param authority
 *            coordinate authority
 * @return authority projections
 */
+(PROJAuthorityProjections *) projectionsWithAuthority: (NSString *) authority;

/**
 * Parse a projection name, expected as 'authority:code' or 'epsg_code',
 * into an authority and code
 *
 * @param name
 *            projection name
 * @return [authority, code]
 */
+(NSArray<NSString *> *) parseAuthorityAndCode: (NSString *) name;

/**
 * Clear all authority projections
 */
+(void) clear;

/**
 * Clear the authority projections
 *
 * @param authority
 *            coordinate authority
 */
+(void) clearAuthority: (NSString *) authority;

/**
 * Clear the authority projection code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            coordinate code
 */
+(void) clearAuthority: (NSString *) authority andNumberCode: (NSNumber *) code;

/**
 * Clear the authority projection code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            coordinate code
 */
+(void) clearAuthority: (NSString *) authority andIntCode: (int) code;

/**
 * Clear the authority projection code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            coordinate code
 */
+(void) clearAuthority: (NSString *) authority andCode: (NSString *) code;

/**
 * Clear the projection, authority and code
 *
 * @param projection
 *            projection
 */
+(void) clearProjection: (PROJProjection *) projection;

/**
 * Clear the transform projections
 *
 * @param transform
 *            projection transform
 */
+(void) clearTransform: (PROJProjectionTransform *) transform;

/**
 * Build a coordinate name from the authority and code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            coordinate code
 * @return name
 */
+(NSString *) coordinateNameWithAuthority: (NSString *) authority andCode: (NSString *) code;

/**
 * Build a coordinate name from the authority and code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            coordinate code
 * @return name
 */
+(NSString *) coordinateNameWithAuthority: (NSString *) authority andIntCode: (int) code;

/**
 * Get the unit of the coordinate reference system
 *
 * @param crs
 *            coordinate reference system
 * @return unit
 */
+(PROJUnit) unitOfCRS: (PJ *) crs;

@end
