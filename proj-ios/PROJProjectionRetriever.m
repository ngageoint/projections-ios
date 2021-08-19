//
//  PROJProjectionRetriever.m
//  proj-ios
//
//  Created by Brian Osborn on 7/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import "PROJProjectionRetriever.h"
#import "PROJProjectionConstants.h"
#import "PROJIOUtils.h"

static NSMutableDictionary<NSString *, NSMutableDictionary *> *properties;

@implementation PROJProjectionRetriever

+(NSString *) projectionWithEpsg: (NSNumber *) epsg{
    return [self projectionWithAuthority:PROJ_AUTHORITY_EPSG andNumberCode:epsg];
}

+(NSString *) projectionWithAuthority: (NSString *) authority andNumberCode: (NSNumber *) code{
    return [self projectionWithAuthority:authority andCode:[code stringValue]];
}

+(NSString *) projectionWithAuthority: (NSString *) authority andCode: (NSString *) code{

    NSMutableDictionary *authorityProperties = [self getOrCreateProjectionsForAuthority:authority];
    
    NSString *projection = [authorityProperties objectForKey:code];
    
    return projection;
}

+(NSMutableDictionary *) getOrCreateProjectionsForAuthority: (NSString *) authority{
    
    if(properties == nil){
        properties = [NSMutableDictionary dictionary];
    }
    
    NSString *authorityKey = [authority lowercaseString];
    
    NSMutableDictionary *authorityProperties = [properties objectForKey:authorityKey];
    if(authorityProperties == nil){
        [self loadPropertiesForAuthority:authorityKey];
        authorityProperties = [properties objectForKey:authorityKey];
    }
    
    return authorityProperties;
}

+(NSMutableDictionary *) projectionsForAuthority: (NSString *) authority{
    return [properties objectForKey:[authority lowercaseString]];
}

+(void) clear{
    [properties removeAllObjects];
}

+(void) clearAuthority: (NSString *) authority{
    [properties removeObjectForKey:[authority lowercaseString]];
}

+(void) clearAuthority: (NSString *) authority andNumberCode: (NSNumber *) code{
    [self clearAuthority:authority andCode:[code stringValue]];
}

+(void) clearAuthority: (NSString *) authority andCode: (NSString *) code{
    NSMutableDictionary *properties = [self projectionsForAuthority:authority];
    if(properties != nil){
        [properties removeObjectForKey:code];
    }
}

+(void) loadPropertiesForAuthority: (NSString *) authority{
    NSString *authorityPropertiesPath = [self propertiesPathForAuthority:authority];
    NSMutableDictionary *authorityProjections = [NSMutableDictionary dictionaryWithContentsOfFile:authorityPropertiesPath];
    [self setProjections:authorityProjections forAuthority:authority];
}

+(NSString *) propertiesPathForAuthority: (NSString *) authority{
    NSString *name = [NSString stringWithFormat:@"%@.%@", PROJ_PROPERTIES, [authority lowercaseString]];
    return [PROJIOUtils propertyListPathWithName:name];
}

+(void) setProjections: (NSMutableDictionary *) projections forAuthority: (NSString *) authority{
    [properties setObject:projections forKey:[authority lowercaseString]];
}

+(void) setProjection: (NSString *) projection forAuthority: (NSString *) authority andNumberCode: (NSNumber *) code{
    [self setProjection:projection forAuthority:authority andCode:[code stringValue]];
}

+(void) setProjection: (NSString *) projection forAuthority: (NSString *) authority andCode: (NSString *) code{
    NSMutableDictionary *authorityProperties = [self getOrCreateProjectionsForAuthority:authority];
    [authorityProperties setObject:projection forKey:code];
}

@end
