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
 * Projections
 */
static PROJProjections *projections;

@implementation PROJProjectionFactory

+(void) initialize{
    if(self == [PROJProjectionFactory self]){
        projections = [[PROJProjections alloc] init];
    }
}

+(PROJProjection *) projectionWithEpsg: (NSNumber *) epsg{
    return [self projectionWithAuthority:PROJ_AUTHORITY_EPSG andNumberCode:epsg];
}

+(PROJProjection *) projectionWithEpsgInt: (int) epsg{
    return [self projectionWithEpsg:[NSNumber numberWithInt:epsg]];
}

+(PROJProjection *) projectionWithName: (NSString *) name{
    
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
    
    return [self projectionWithAuthority:authority andCode:code];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code{
    return [self projectionWithAuthority:authority andCode:[code stringValue]];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andIntCode: (int) code{
    return [self projectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code]];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andCode: (NSString *) code{
    return [self projectionWithAuthority:authority andCode:code andParams:nil andDefinition:nil];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andParams: (NSString *) params{
    return [self projectionWithAuthority:authority andCode:[code stringValue] andParams:params];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andIntCode: (int) code andParams: (NSString *) params{
    return [self projectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code] andParams:params];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params{
    return [self projectionWithAuthority:authority andCode:code andParams:params andDefinition:nil];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code andParams: (NSString *) params andDefinition: (NSString *) definition{
    return [self projectionWithAuthority:authority andCode:[code stringValue] andParams:params andDefinition:definition];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andIntCode: (int) code andParams: (NSString *) params andDefinition: (NSString *) definition{
    return [self projectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code] andParams:params andDefinition:definition];
}

+(PROJProjection *) projectionWithAuthority: (NSString *) authority andCode: (NSString *) code andParams: (NSString *) params andDefinition: (NSString *) definition{
    
    authority = [authority uppercaseString];
    
    // Check if the projection already exists
    PROJProjection *projection = [projections projectionForAuthority:authority andCode:code];
    
    if(projection == nil){
        
        // Try to get or create the projection from a definition
        projection = [self fromDefinition:definition withAuthority:authority andCode:code];
        
        if(projection == nil){
            
            // Try to create the projection from the provided params
            projection = [self fromParams:params withAuthority:authority andCode:code];
            
            if(projection == nil){
                
                // Try to create the projection from properties
                projection = [self fromPropertiesWithAuthority:authority andCode:code];
                
                if(projection == nil){
                    [NSException raise:@"" format:@"Failed to create projection for authority: %@, code: %@, definition: %@, params: %@", authority, code, definition, params];
                }
            }
        }
    }
    
    return projection;
}

+(PROJProjection *) projectionByDefinition: (NSString *) definition{
    return nil; // TODO
}

+(PROJProjections *) projections{
    return projections;
}

+(PROJAuthorityProjections *) projectionsWithAuthority: (NSString *) authority{
    return [projections projectionsForAuthority:authority];
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
        
        @try {
            projPJ crs = nil;
            CRSObject *definitionCRS = [CRSReader read:definition];
            if(definitionCRS != nil){
                crs = [PROJCRSParser convertCRS:definitionCRS];
            }
            if(crs != nil){
                projection = [PROJProjection projectionWithAuthority:authority andCode:code andCrs:crs andDefinition:definition andDefinitionCrs:definitionCRS];
                [projections addProjection:projection];
            }
        } @catch (NSException *exception) {
            NSLog(@"Failed to create projection for authority: %@, code: %@, definition: %@", authority, code, definition);
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
 * @return projection
 */
+(PROJProjection *) fromParams: (NSString *) params withAuthority: (NSString *) authority andCode: (NSString *) code{
    
    PROJProjection *projection = nil;
    
    if (params != nil && params.length > 0) {
        projPJ crs = pj_init_plus([params UTF8String]);
        if(crs != nil){
            projection = [PROJProjection projectionWithAuthority:authority andCode:code andCrs:crs];
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
 * @return projection
 */
+(PROJProjection *) fromPropertiesWithAuthority: (NSString *) authority andCode: (NSString *) code{
    
    PROJProjection *projection = nil;
    
    NSString *parameters = [PROJProjectionRetriever projectionWithAuthority:authority andCode:code];
    
    if(parameters != nil && parameters.length > 0){
        projPJ crs = pj_init_plus([parameters UTF8String]);
        if(crs != nil){
            projection = [PROJProjection projectionWithAuthority:authority andCode:code andCrs:crs];
            [projections addProjection:projection];
        }else{
            NSLog(@"Failed to create projection for authority: %@, code: %@, parameters: %@", authority, code, parameters);
        }
    }
    
    return projection;
}

@end
