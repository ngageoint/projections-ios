//
//  PROJLocationCoordinate3D.m
//  proj-ios
//
//  Created by Brian Osborn on 7/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import "PROJLocationCoordinate3D.h"

@implementation PROJLocationCoordinate3D

-(instancetype) initWithCoordinate: (CLLocationCoordinate2D) coordinate{
    return [self initWithCoordinate:coordinate andZ:nil];
}

-(instancetype) initWithCoordinate: (CLLocationCoordinate2D) coordinate andZ: (NSDecimalNumber *) z{
    self = [super init];
    if(self){
        self.coordinate = coordinate;
        self.z = z;
    }
    return self;
}

-(BOOL) hasZ{
    return self.z != nil;
}

@end
