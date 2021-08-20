//
//  PROJProjectionFactory.m
//  proj-ios
//
//  Created by Brian Osborn on 5/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import "PROJProjectionFactory.h"
#import "proj_api.h"
#import "PROJProjectionRetriever.h"
#import "PROJProjectionConstants.h"
#import "CRSReader.h"
#import "PROJCRSParser.h"

/**
 * Default projection factory retrieval order
 */
static NSOrderedSet<NSNumber *> *defaultOrder;

/**
 * Projections
 */
static PROJProjections *projections;

/**
 * Projection factory retrieval order
 */
static NSMutableOrderedSet<NSNumber *> *order;

@implementation PROJProjectionFactory

+(void) initialize{
    if(defaultOrder == nil){
        defaultOrder = [NSOrderedSet orderedSetWithObjects:
                        [NSNumber numberWithInt:PROJ_FACTORY_CACHE],
                        [NSNumber numberWithInt:PROJ_FACTORY_DEFINITION],
                        [NSNumber numberWithInt:PROJ_FACTORY_PARAMETERS],
                        [NSNumber numberWithInt:PROJ_FACTORY_PROPERTIES],
                        nil];
    }
    if(projections == nil){
        projections = [[PROJProjections alloc] init];
    }
    if(order == nil){
        order = [NSMutableOrderedSet orderedSet];
    }
    [self resetOrder];
}

+(void) resetOrder{
    [self setOrder:defaultOrder];
}

+(NSOrderedSet<NSNumber *> *) order{
    return [NSOrderedSet orderedSetWithOrderedSet:order];
}

+(NSOrderedSet<NSNumber *> *) cachelessOrder{
    NSMutableOrderedSet<NSNumber *> *orderCopy = [NSMutableOrderedSet orderedSetWithOrderedSet:[self order]];
    [orderCopy removeObject:[NSNumber numberWithInt:PROJ_FACTORY_CACHE]];
    return orderCopy;
}

+(void) removeOrderType: (enum PROJProjectionFactoryType) type{
    [order removeObject:[NSNumber numberWithInt:type]];
    if(order.count == 0){
        [self resetOrder];
    }
}

+(void) setOrder: (NSOrderedSet<NSNumber *> *) types{
    [order removeAllObjects];
    if(types == nil || types.count == 0){
        [self resetOrder];
    }else{
        for(NSNumber *type in types){
            [order addObject:type];
        }
    }
}

+(NSOrderedSet *) buildDefaultOrder{
    return [self buildOrder:defaultOrder];
}

+(NSOrderedSet *) buildOrder: (NSOrderedSet<NSNumber *> *) types{
    NSMutableOrderedSet<NSNumber *> *tempOrder = [NSMutableOrderedSet orderedSet];
    for(NSNumber *type in types){
        [tempOrder addObject:type];
    }
    return tempOrder;
}

+(PROJProjection *) projectionWithEpsg: (NSNumber *) epsg{
    return [self projectionWithAuthority:PROJ_AUTHORITY_EPSG andNumberCode:epsg];
}

+(PROJProjection *) cachelessProjectionWithEpsg: (NSNumber *) epsg{
    return [self cachelessProjectionWithAuthority:PROJ_AUTHORITY_EPSG andNumberCode:epsg];
}

+(PROJProjection *) projectionWithEpsgInt: (int) epsg{
    return [self projectionWithEpsg:[NSNumber numberWithInt:epsg]];
}

+(PROJProjection *) cachelessProjectionWithEpsgInt: (int) epsg{
    return [self cachelessProjectionWithEpsg:[NSNumber numberWithInt:epsg]];
}

+(PROJProjection *) projectionWithName: (NSString *) name{
    NSArray<NSString *> *authorityAndCode = [self parseAuthorityAndCode:name];
    return [self projectionWithAuthority:[authorityAndCode objectAtIndex:0] andCode:[authorityAndCode objectAtIndex:1]];
}

+(PROJProjection *) cachelessProjectionWithName: (NSString *) name{
    NSArray<NSString *> *authorityAndCode = [self parseAuthorityAndCode:name];
    return [self cachelessProjectionWithAuthority:[authorityAndCode objectAtIndex:0] andCode:[authorityAndCode objectAtIndex:1]];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code{
    return [self projectionWithAuthority:authority andCode:[code stringValue]];
}

+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code{
    return [self cachelessProjectionWithAuthority:authority andCode:[code stringValue]];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andIntCode: (int) code{
    return [self projectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code]];
}

+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andIntCode: (int) code{
    return [self cachelessProjectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code]];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andCode: (NSString *) code{
    return [self projectionWithAuthority:authority andCode:code andParams:nil andDefinition:nil];
}

+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andCode: (NSString *) code{
    return [self cachelessProjectionWithAuthority:authority andCode:code andParams:nil andDefinition:nil];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andParams: (NSString *) params{
    return [self projectionWithAuthority:authority andCode:[code stringValue] andParams:params];
}

+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andParams: (NSString *) params{
    return [self cachelessProjectionWithAuthority:authority andCode:[code stringValue] andParams:params];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andIntCode: (int) code andParams: (NSString *) params{
    return [self projectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code] andParams:params];
}

+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andIntCode: (int) code andParams: (NSString *) params{
    return [self cachelessProjectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code] andParams:params];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params{
    return [self projectionWithAuthority:authority andCode:code andParams:params andDefinition:nil];
}

+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params{
    return [self cachelessProjectionWithAuthority:authority andCode:code andParams:params andDefinition:nil];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andParams: (NSString *) params andDefinition: (NSString *) definition{
    return [self projectionWithAuthority:authority andCode:[code stringValue] andParams:params andDefinition:definition];
}

+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andParams: (NSString *) params andDefinition: (NSString *) definition{
    return [self cachelessProjectionWithAuthority:authority andCode:[code stringValue] andParams:params andDefinition:definition];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andIntCode: (int) code andParams: (NSString *) params andDefinition: (NSString *) definition{
    return [self projectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code] andParams:params andDefinition:definition];
}

+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andIntCode: (int) code andParams: (NSString *) params andDefinition: (NSString *) definition{
    return [self cachelessProjectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code] andParams:params andDefinition:definition];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params andDefinition: (NSString *) definition{
    return [self projectionWithTypes:order andAuthority:authority andCode:code andParams:params andDefinition:definition];
}

+(PROJProjection *) cachelessProjectionWithAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params andDefinition: (NSString *) definition{
    return [self projectionWithTypes:[self cachelessOrder] andAuthority:authority andCode:code andParams:params andDefinition:definition];
}

+(PROJProjection *) projectionWithTypes: (NSOrderedSet<NSNumber *> *) types andAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params andDefinition: (NSString *) definition{
    
    PROJProjection *projection = nil;
    
    for(NSNumber *typeNumber in types){
        
        enum PROJProjectionFactoryType type = [typeNumber intValue];
        projection = [self projectionWithType:type andAuthority:authority andCode:code andParams:params andDefinition:definition];
        
        if(projection != nil){
            
            switch(type){
                    
                case PROJ_FACTORY_CACHE:
                    // Check if the definition does not match the cached
                    // projection
                    if(definition != nil && definition.length > 0 && ![definition isEqualToString:[projection definition]]){
                        projection = nil;
                    }
                    break;
                    
                default:
                    break;
            }
            
        }
        
        if(projection != nil){
            break;
        }
        
    }

    if(projection == nil){
        [NSException raise:@"Projection Creation" format:@"Failed to create projection for authority: %@, code: %@, definition: %@, params: %@", authority, code, definition, params];
    }

    return projection;
}
    
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
+(PROJProjection *) projectionWithType: (enum PROJProjectionFactoryType) type andAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params andDefinition: (NSString *) definition{
    
    PROJProjection *projection = nil;

    authority = [authority uppercaseString];

    switch (type) {

        case PROJ_FACTORY_CACHE:
            projection = [self fromCacheWithAuthority:authority andCode:code];
            break;

        case PROJ_FACTORY_DEFINITION:
            projection = [self fromDefinition:definition withAuthority:authority andCode:code];
            break;

        case PROJ_FACTORY_PARAMETERS:
            projection = [self fromParams:params withAuthority:authority andCode:code andDefinition:definition];
            break;

        case PROJ_FACTORY_PROPERTIES:
            projection = [self fromPropertiesWithAuthority:authority andCode:code andDefinition:definition];
            break;

        default:
            [NSException raise:@"Unsupported Type" format:@"Unsupported projection factory type: %u", type];
            break;
            
    }

    return projection;
}

+(PROJProjection *) projectionByDefinition: (NSString *) definition{
    return [self projectionByDefinition:definition withCacheless:NO];
}

+(PROJProjection *) cachelessProjectionByDefinition: (NSString *) definition{
    return [self projectionByDefinition:definition withCacheless:YES];
}

/**
 * Get the projection for the definition
 *
 * @param cacheless
 *            cacheless retrieval
 * @param definition
 *            definition
 * @return projection
 */
+(PROJProjection *) projectionByDefinition: (NSString *) definition withCacheless: (BOOL) cacheless{

    PROJProjection *projection = nil;

    if(definition != nil && definition.length > 0){

        CRSObject *definitionCRS = [CRSReader read:definition];

        if(definitionCRS != nil){

            NSString *authority = nil;
            NSString *code = nil;

            if([definitionCRS hasIdentifiers]){
                CRSIdentifier *identifier = [definitionCRS identifierAtIndex:0];
                authority = identifier.name;
                code = identifier.uniqueIdentifier;
            }

            BOOL cacheProjection = YES;

            if(authority != nil && code != nil){

                if(!cacheless){

                    // Check if the projection already exists
                    projection = [self fromCacheWithAuthority:authority andCode:code];

                    // Check if the definition does not match the cached
                    // projection
                    if(projection != nil && ![definition isEqualToString:[projection definition]]){
                        projection = nil;
                    }

                }

            }else{

                cacheProjection = NO;

                if(authority == nil){
                    authority = @"";
                }
                if(code == nil){
                    code = @"";
                }

            }

            if(projection == nil){

                projPJ crs = [PROJCRSParser convertCRS:definitionCRS];
                if(crs != nil){
                    projection = [PROJProjection projectionWithAuthority:authority andCode:code andCrs:crs andDefinition:definition andDefinitionCrs:definitionCRS];
                    if(cacheProjection){
                        [projections addProjection:projection];
                    }
                }

            }

        }

    }

    if(projection == nil){
        [NSException raise:@"Projection Creation" format:@"Failed to create projection for definition: %@", definition];
    }

    return projection;
}

+(PROJProjections *) projections{
    return projections;
}

+(PROJAuthorityProjections *) projectionsWithAuthority: (NSString *) authority{
    return [projections projectionsForAuthority:authority];
}

+(NSArray<NSString *> *) parseAuthorityAndCode: (NSString *) name{
    
    NSString *authority = nil;
    NSString *code = nil;
    
    NSArray<NSString *> *projectionParts = [name componentsSeparatedByString:@":"];
    
    switch(projectionParts.count){
        case 1:
            authority = PROJ_AUTHORITY_EPSG;
            code = [projectionParts firstObject];
            break;
        case 2:
            authority = [projectionParts firstObject];
            code = [projectionParts objectAtIndex:1];
            break;
        default:
            [NSException raise:@"Invalid Projection" format:@"Invalid projection name '%@', expected 'authority:code' or 'epsg_code'", name];
    }
    
    return [NSArray arrayWithObjects:authority, code, nil];
}

+(void) clear{
    [projections clear];
}

+(void) clearAuthority: (NSString *) authority{
    [projections clearAuthority:authority];
}

+(void) clearAuthority: (NSString *) authority andNumberCode: (NSNumber *) code{
    [projections removeAuthority:authority andNumberCode:code];
}

+(void) clearAuthority: (NSString *) authority andIntCode: (int) code{
    [self clearAuthority:authority andNumberCode:[NSNumber numberWithInt:code]];
}

+(void) clearAuthority: (NSString *) authority andCode: (NSString *) code{
    [projections removeAuthority:authority andCode:code];
}

/**
 * Retrieve a projection from the cache
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            coordinate code
 * @return projection
 */
+(PROJProjection *) fromCacheWithAuthority: (NSString *) authority andCode: (NSString *) code{
    return [projections projectionForAuthority:authority andCode:code];
}

/**
 * Create a projection from the WKT definition
 *
 * @param definition
 *            WKT coordinate definition
 * @param authority
 *            authority
 * @param code
 *            coordinate code
 * @return projection
 */
+(PROJProjection *) fromDefinition: (NSString *) definition withAuthority: (NSString *) authority andCode: (NSString *) code{

    PROJProjection *projection = nil;
    
    if(definition != nil && definition.length > 0){
        
        @try{
            projPJ crs = nil;
            CRSObject *definitionCRS = [CRSReader read:definition];
            if(definitionCRS != nil){
                crs = [PROJCRSParser convertCRS:definitionCRS];
            }
            if(crs != nil){
                projection = [PROJProjection projectionWithAuthority:authority andCode:code andCrs:crs andDefinition:definition andDefinitionCrs:definitionCRS];
                [projections addProjection:projection];
            }
        }@catch (NSException *exception) {
            NSLog(@"Failed to create projection for authority: %@, code: %@, definition: %@, error: %@", authority, code, definition, exception);
        }
        
    }
    
    return projection;
}

/**
 * Create a projection from the proj4 parameters
 *
 * @param params
 *            proj4 parameters
 * @param authority
 *            authority
 * @param code
 *            coordinate code
 * @param definition
 *            WKT coordinate definition
 * @return projection
 */
+(PROJProjection *) fromParams: (NSString *) params withAuthority: (NSString *) authority andCode: (NSString *) code andDefinition: (NSString *) definition{
    
    PROJProjection *projection = nil;
    
    if (params != nil && params.length > 0) {
        projPJ crs = pj_init_plus([params UTF8String]);
        if(crs != nil){
            projection = [PROJProjection projectionWithAuthority:authority andCode:code andCrs:crs andDefinition:definition];
            [projections addProjection:projection];
        }else{
            NSLog(@"Failed to create projection for authority: %@, code: %@, parameters: %@", authority, code, params);
        }
    }
    
    return projection;
}

/**
 * Create a projection from configured coordinate properties
 *
 * @param authority
 *            authority
 * @param code
 *            coordinate code
 * @param definition
 *            WKT coordinate definition
 * @return projection
 */
+(PROJProjection *) fromPropertiesWithAuthority: (NSString *) authority andCode: (NSString *) code andDefinition: (NSString *) definition{
    
    PROJProjection *projection = nil;
    
    NSString *parameters = [PROJProjectionRetriever projectionWithAuthority:authority andCode:code];
    
    if(parameters != nil && parameters.length > 0){
        projPJ crs = pj_init_plus([parameters UTF8String]);
        if(crs != nil){
            projection = [PROJProjection projectionWithAuthority:authority andCode:code andCrs:crs andDefinition:definition];
            [projections addProjection:projection];
        }else{
            NSLog(@"Failed to create projection for authority: %@, code: %@, parameters: %@", authority, code, parameters);
        }
    }
    
    return projection;
}

@end
