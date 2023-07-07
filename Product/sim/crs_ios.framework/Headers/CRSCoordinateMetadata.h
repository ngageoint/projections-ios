//
//  CRSCoordinateMetadata.h
//  crs-ios
//
//  Created by Brian Osborn on 7/19/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSCoordinateReferenceSystem.h"

/**
 * Coordinate metadata
 */
@interface CRSCoordinateMetadata : CRSObject

/**
 * Coordinate Reference System
 */
@property (nonatomic, strong) CRSCoordinateReferenceSystem *coordinateReferenceSystem;

/**
 *  Coordinate Epoch
 */
@property (nonatomic, strong) NSDecimalNumber *epoch;

/**
 *  Coordinate Epoch Text
 */
@property (nonatomic, strong) NSString *epochText;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSCoordinateMetadata *) create;

/**
 *  Initialize
 *
 *  @return new instance
 */
-(instancetype) init;

/**
 *  Initialize
 *
 * @param crs
 *            coordinate reference system
 *
 *  @return new instance
 */
-(instancetype) initWithCoordinateReferenceSystem: (CRSCoordinateReferenceSystem *) crs;

/**
 *  Initialize
 *
 * @param crs
 *            coordinate reference system
 * @param epoch
 *            coordinate epoch
 *
 *  @return new instance
 */
-(instancetype) initWithCoordinateReferenceSystem: (CRSCoordinateReferenceSystem *) crs andEpoch: (NSDecimalNumber *) epoch;

/**
 *  Initialize
 *
 * @param crs
 *            coordinate reference system
 * @param epoch
 *            coordinate epoch
 *
 *  @return new instance
 */
-(instancetype) initWithCoordinateReferenceSystem: (CRSCoordinateReferenceSystem *) crs andEpochText: (NSString *) epoch;

/**
 * Has a coordinate epoch
 *
 * @return true if has coordinate epoch
 */
-(BOOL) hasEpoch;

@end
