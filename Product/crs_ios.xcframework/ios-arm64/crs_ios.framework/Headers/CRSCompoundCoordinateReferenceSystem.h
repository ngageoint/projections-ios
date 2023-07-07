//
//  CRSCompoundCoordinateReferenceSystem.h
//  crs-ios
//
//  Created by Brian Osborn on 7/19/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSSimpleCoordinateReferenceSystem.h"

/**
 * Compound Coordinate Reference System
 */
@interface CRSCompoundCoordinateReferenceSystem : CRSCoordinateReferenceSystem

/**
 * Coordinate Reference Systems
 */
@property (nonatomic, strong) NSMutableArray<CRSSimpleCoordinateReferenceSystem *> *coordinateReferenceSystems;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSCompoundCoordinateReferenceSystem *) create;

/**
 *  Initialize
 *
 *  @return new instance
 */
-(instancetype) init;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param type
 *            coordinate reference system type
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andType: (enum CRSType) type;

/**
 * Number of coordinate reference systems
 *
 * @return coordinate reference systems count
 */
-(int) numCoordinateReferenceSystems;

/**
 * Get the coordinate reference system at the index
 *
 * @param index
 *            crs index
 * @return coordinate reference system
 */
-(CRSSimpleCoordinateReferenceSystem *) coordinateReferenceSystemAtIndex: (int) index;

/**
 * Add the coordinate reference system
 *
 * @param crs
 *            coordinate reference system
 */
-(void) addCoordinateReferenceSystem: (CRSSimpleCoordinateReferenceSystem *) crs;

/**
 * Add the coordinate reference systems
 *
 * @param crss
 *            coordinate reference systems
 */
-(void) addCoordinateReferenceSystems: (NSArray<CRSSimpleCoordinateReferenceSystem *> *) crss;

@end
