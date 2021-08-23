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
@property (nonatomic, strong) NSMutableDictionary<NSString *, PROJAuthorityProjections *> *authorityProjections;

@end

@implementation PROJProjections

-(instancetype) init{
    self = [super init];
    if(self != nil){
        _authorityProjections = [NSMutableDictionary dictionary];
    }
    return self;
}

-(PROJAuthorityProjections *) projectionsForAuthority: (NSString *) authority{
    return [_authorityProjections objectForKey:[authority uppercaseString]];
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
        [_authorityProjections setObject:authorityProjections forKey:[authorityProjections authority]];
    }
    [authorityProjections addProjection:projection];
}

-(void) clear{
    NSArray<NSString *> *authorities = [NSArray arrayWithArray:[self authorities]];
    for(NSString *authority in authorities){
        [self clearAuthority:authority];
    }
}

-(void) clearAuthority: (NSString *) authority{
    PROJAuthorityProjections *authorityProjections = [self projectionsForAuthority:authority];
    if(authorityProjections != nil){
        [authorityProjections clear];
        [_authorityProjections removeObjectForKey:[authority uppercaseString]];
    }
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
    return (int) _authorityProjections.count;
}

-(NSArray<NSString *> *) authorities{
    return [_authorityProjections allKeys];
}

-(int) projectionCount{
    int count = 0;
    for(PROJAuthorityProjections *authorityProjections in [_authorityProjections allValues]){
        count += [authorityProjections count];
    }
    return count;
}

-(BOOL) isEmpty{
    return _authorityProjections.count == 0;
}

@end
