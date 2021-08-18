//
//  PROJAuthorityProjections.m
//  proj-ios
//
//  Created by Brian Osborn on 7/19/17.
//  Copyright © 2017 NGA. All rights reserved.
//

#import "PROJAuthorityProjections.h"

@interface PROJAuthorityProjections()

/**
 *  Coordinate authority
 */
@property (nonatomic, strong) NSString *authority;

/**
 * Projections by code
 */
@property (nonatomic, strong) NSMutableDictionary<NSString *, PROJProjection *> *codeProjections;

@end

@implementation PROJAuthorityProjections

-(instancetype) initWithAuthority: (NSString *) authority{
    self = [super init];
    if(self != nil){
        _codeProjections = [[NSMutableDictionary alloc] init];
        _authority = authority;
    }
    return self;
}

-(NSString *) authority{
    return _authority;
}

-(PROJProjection *)  projectionForNumberCode: (NSNumber *) code{
    return [self projectionForCode:[code stringValue]];
}

-(PROJProjection *) projectionForCode: (NSString *) code{
    return [_codeProjections objectForKey:[code uppercaseString]];
}

-(BOOL) hasProjection: (PROJProjection *) projection{
    return [self hasProjectionCode:[projection code]];
}

-(BOOL) hasProjectionNumberCode: (NSNumber *) code{
    return [self hasProjectionCode:[code stringValue]];
}

-(BOOL) hasProjectionCode: (NSString *) code{
    return [self projectionForCode:code] != nil;
}

-(void) addProjection: (PROJProjection *) projection{
    [_codeProjections setObject:projection forKey:[projection.code uppercaseString]];
}

-(void) clear{
    [_codeProjections removeAllObjects];
}

-(void) removeNumberCode: (NSNumber *) code{
    [self removeCode:[code stringValue]];
}

-(void) removeCode: (NSString *) code{
    [_codeProjections removeObjectForKey:[code uppercaseString]];
}

-(void) removeProjection: (PROJProjection *) projection{
    [self removeCode:[projection code]];
}

-(int) count{
    return (int) _codeProjections.count;
}

-(int) isEmpty{
    return [self count] == 0;
}

-(NSArray<NSString *> *) codes{
    return [_codeProjections allKeys];
}

-(NSArray<PROJProjection *> *) projections{
    return [_codeProjections allValues];
}

@end
