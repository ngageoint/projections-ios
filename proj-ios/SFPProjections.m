//
//  SFPProjections.m
//  proj-ios
//
//  Created by Brian Osborn on 7/16/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "SFPProjections.h"

@interface SFPProjections()

/**
 * Mapping of authorities to authority projections
 */
@property (nonatomic, strong) NSMutableDictionary<NSString *, SFPAuthorityProjections *> *authorities;

@end

@implementation SFPProjections

-(instancetype) init{
    self = [super init];
    if(self != nil){
        self.authorities = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(SFPAuthorityProjections *) projectionsForAuthority: (NSString *) authority{
    return [self.authorities objectForKey:[authority uppercaseString]];
}

-(SFPProjection *) projectionForAuthority: (NSString *) authority andCode: (NSString *) code{
    SFPProjection *projection = nil;
    SFPAuthorityProjections *authorityProjections = [self projectionsForAuthority:authority];
    if(authorityProjections != nil){
        projection = [authorityProjections projectionForCode:code];
    }
    return projection;
}

-(BOOL) hasProjection: (SFPProjection *) projection{
    return [self hasProjectionWithAuthority:[projection authority] andCode:[projection code]];
}

-(BOOL) hasProjectionWithAuthority: (NSString *) authority andCode: (NSString *) code{
    return [self projectionForAuthority:authority andCode:code] != nil;
}

-(void) addProjection: (SFPProjection *) projection{
    NSString *authority = [projection authority];
    SFPAuthorityProjections *authorityProjections = [self projectionsForAuthority:authority];
    if(authorityProjections == nil){
        authorityProjections = [[SFPAuthorityProjections alloc] initWithAuthority:[authority uppercaseString]];
        [self.authorities setObject:authorityProjections forKey:[authorityProjections authority]];
    }
    [authorityProjections addProjection:projection];
}

-(void) clear{
    [self.authorities removeAllObjects];
}

-(void) clearAuthority: (NSString *) authority{
    [self.authorities removeObjectForKey:[authority uppercaseString]];
}

-(void) removeAuthority: (NSString *) authority andNumberCode: (NSNumber *) code{
    [self removeAuthority:authority andCode:[code stringValue]];
}

-(void) removeAuthority: (NSString *) authority andCode: (NSString *) code{
    SFPAuthorityProjections *authorityProjections = [self projectionsForAuthority:authority];
    if(authorityProjections != nil){
        [authorityProjections removeCode:code];
        if([authorityProjections isEmpty]){
            [self clearAuthority:authority];
        }
    }
}

-(void) removeProjection: (SFPProjection *) projection{
    [self removeAuthority:[projection authority] andCode:[projection code]];
}

-(int) authorityCount{
    return (int) self.authorities.count;
}

-(int) projectionCount{
    int count = 0;
    for(SFPAuthorityProjections *authorityProjections in [self.authorities allValues]){
        count += [authorityProjections count];
    }
    return count;
}

-(BOOL) isEmpty{
    return self.authorities.count == 0;
}

@end
