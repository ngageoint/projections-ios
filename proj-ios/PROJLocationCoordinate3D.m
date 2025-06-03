//
//  PROJLocationCoordinate3D.m
//  proj-ios
//
//  Created by Brian Osborn on 7/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import <Projections/PROJLocationCoordinate3D.h>

@implementation PROJLocationCoordinate3D

+(PROJLocationCoordinate3D *) coordinateWithCoordinate: (CLLocationCoordinate2D) coordinate{
    return [[PROJLocationCoordinate3D alloc] initWithCoordinate:coordinate];
}

+(PROJLocationCoordinate3D *) coordinateWithCoordinate: (CLLocationCoordinate2D) coordinate andZ: (NSDecimalNumber *) z{
    return [[PROJLocationCoordinate3D alloc] initWithCoordinate:coordinate andZ:z];
}

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
