//
//  PROJProjections.m
//  proj-ios
//
//  Created by Brian Osborn on 7/16/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "PROJProjections.h"

@interface PROJProjections()

/**
 * Mapping of authorities to authority projections
 */
@property (nonatomic, strong) NSMutableDictionary<NSString *, PROJAuthorityProjections *> *authorities;

@end

@implementation PROJProjections

-(instancetype) init{
    self = [super init];
    if(self != nil){
        self.authorities = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(PROJAuthorityProjections *) projectionsForAuthority: (NSString *) authority{
    return [self.authorities objectForKey:[authority uppercaseString]];
}

-(PROJProjection *) projectionForAuthority: (NSString *) authority andCode: (NSString *) code{
    PROJProjection *projection = nil;
    PROJAuthorityProjections *authorityProjections = [self projectionsForAuthority:authority];
    if(authorityProjections != nil){
        projection = [authorityProjections projectionForCode:code];
    }
    return projection;
}

-(BOOL) hasProjection: (PROJProjection *) projection{
    return [self hasProjectionWithAuthority:[projection authority] andCode:[projection code]];
}

-(BOOL) hasProjectionWithAuthority: (NSString *) authority andCode: (NSString *) code{
    return [self projectionForAuthority:authority andCode:code] != nil;
}

-(void) addProjection: (PROJProjection *) projection{
    NSString *authority = [projection authority];
    PROJAuthorityProjections *authorityProjections = [self projectionsForAuthority:authority];
    if(authorityProjections == nil){
        authorityProjections = [[PROJAuthorityProjections alloc] initWithAuthority:[authority uppercaseString]];
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
    PROJAuthorityProjections *authorityProjections = [self projectionsForAuthority:authority];
    if(authorityProjections != nil){
        [authorityProjections removeCode:code];
        if([authorityProjections isEmpty]){
            [self clearAuthority:authority];
        }
    }
}

-(void) removeProjection: (PROJProjection *) projection{
    [self removeAuthority:[projection authority] andCode:[projection code]];
}

-(int) authorityCount{
    return (int) self.authorities.count;
}

-(int) projectionCount{
    int count = 0;
    for(PROJAuthorityProjections *authorityProjections in [self.authorities allValues]){
        count += [authorityProjections count];
    }
    return count;
}

-(BOOL) isEmpty{
    return self.authorities.count == 0;
}

@end
