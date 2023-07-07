//
//  CRSCoordinateSystem.h
//  crs-ios
//
//  Created by Brian Osborn on 7/15/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSCoordinateSystemTypes.h"
#import "CRSAxis.h"

/**
 * Coordinate System
 */
@interface CRSCoordinateSystem : NSObject<CRSIdentifiable>

/**
 * Type
 */
@property (nonatomic) enum CRSCoordinateSystemType type;

/**
 * Dimension
 */
@property (nonatomic) int dimension;

/**
 * Identifiers
 */
@property (nonatomic, strong) NSMutableArray<CRSIdentifier *> *identifiers;

/**
 * Axes
 */
@property (nonatomic, strong) NSMutableArray<CRSAxis *> *axes;

/**
 * Unit
 */
@property (nonatomic, strong) CRSUnit *unit;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSCoordinateSystem *) create;

/**
 *  Initialize
 *
 *  @return new instance
 */
-(instancetype) init;

/**
 *  Initialize
 *
 * @param type
 *            type
 * @param dimension
 *            dimension
 * @param axis
 *            axis
 *
 *  @return new instance
 */
-(instancetype) initWithType: (enum CRSCoordinateSystemType) type andDimension: (int) dimension andAxis: (CRSAxis *) axis;

/**
 *  Initialize
 *
 * @param type
 *            type
 * @param dimension
 *            dimension
 * @param axes
 *            axes
 *
 *  @return new instance
 */
-(instancetype) initWithType: (enum CRSCoordinateSystemType) type andDimension: (int) dimension andAxes: (NSArray<CRSAxis *> *) axes;

/**
 * Number of axes
 *
 * @return axes count
 */
-(int) numAxes;

/**
 * Get the axis at the index
 *
 * @param index
 *            axis index
 * @return axis
 */
-(CRSAxis *) axisAtIndex: (int) index;

/**
 * Add the axis
 *
 * @param axis
 *            axis
 */
-(void) addAxis: (CRSAxis *) axis;

/**
 * Add the axes
 *
 * @param axes
 *            axes
 */
-(void) addAxes: (NSArray<CRSAxis *> *) axes;

/**
 * Has a unit
 *
 * @return true if has unit
 */
-(BOOL) hasUnit;

/**
 * Get the axis unit, either the CS unit or first axis with unit
 *
 * @return unit
 */
-(CRSUnit *) axisUnit;

@end
