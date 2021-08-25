//
//  PROJPrimeMeridian.m
//  proj-ios
//
//  Created by Brian Osborn on 8/25/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "PROJPrimeMeridian.h"

@interface PROJPrimeMeridian()

@property (nonatomic) enum PROJPrimeMeridianType type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) double offsetFromGreenwich;

@end

@implementation PROJPrimeMeridian

/**
 * Type to Prime Meridian mapping
 */
static NSMutableDictionary<NSNumber *, PROJPrimeMeridian *> *typePrimeMeridians = nil;

/**
 * Name to Prime Meridian mapping
 */
static NSMutableDictionary<NSString *, PROJPrimeMeridian *> *namePrimeMeridians = nil;

+(void) initialize{
    typePrimeMeridians = [NSMutableDictionary dictionary];
    namePrimeMeridians = [NSMutableDictionary dictionary];
 
    // TODO
    
}

+(void) initializePrimeMeridian: (PROJPrimeMeridian *) primeMeridian{
    
    [typePrimeMeridians setObject:primeMeridian forKey:[NSNumber numberWithInt:primeMeridian.type]];
    [namePrimeMeridians setObject:primeMeridian forKey:[primeMeridian.name lowercaseString]];

}

// TODO

@end
