//
//  SFPAuthorityProjections.m
//  sf-ios-proj
//
//  Created by Brian Osborn on 7/19/17.
//  Copyright © 2017 NGA. All rights reserved.
//

#import "SFPAuthorityProjections.h"

@interface SFPAuthorityProjections()

/**
 *  Coordinate authority
 */
@property (nonatomic, strong) NSString *authority;

/**
 * Projections by code
 */
@property (nonatomic, strong) NSMutableDictionary<NSString *, SFPProjection *> *projections;

@end

@implementation SFPAuthorityProjections

-(instancetype) initWithAuthority: (NSString *) authority{
    self = [super init];
    if(self != nil){
        self.projections = [[NSMutableDictionary alloc] init];
        self.authority = authority;
    }
    return self;
}

-(NSString *) authority{
    return _authority;
}

-(SFPProjection *)  projectionForNumberCode: (NSNumber *) code{
    return [self projectionForCode:[code stringValue]];
}

-(SFPProjection *) projectionForCode: (NSString *) code{
    return [_projections objectForKey:[code uppercaseString]];
}

-(BOOL) hasProjection: (SFPProjection *) projection{
    return [self hasProjectionCode:[projection code]];
}

-(BOOL) hasProjectionNumberCode: (NSNumber *) code{
    return [self hasProjectionCode:[code stringValue]];
}

-(BOOL) hasProjectionCode: (NSString *) code{
    return [self projectionForCode:code] != nil;
}

-(void) addProjection: (SFPProjection *) projection{
    [_projections setObject:projection forKey:[projection.code uppercaseString]];
}

-(void) clear{
    [_projections removeAllObjects];
}

-(void) removeNumberCode: (NSNumber *) code{
    [self removeCode:[code stringValue]];
}

-(void) removeCode: (NSString *) code{
    [_projections removeObjectForKey:[code uppercaseString]];
}

-(void) removeProjection: (SFPProjection *) projection{
    [self removeCode:[projection code]];
}

-(int) count{
    return (int) self.projections.count;
}

-(int) isEmpty{
    return [self count] == 0;
}

-(NSArray<NSString *> *) getCodes{
    return [self.projections allKeys];
}

-(NSArray<SFPProjection *> *) getProjections{
    return [self.projections allValues];
}

@end
