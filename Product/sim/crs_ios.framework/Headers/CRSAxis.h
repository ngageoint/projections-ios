//
//  CRSAxis.h
//  crs-ios
//
//  Created by Brian Osborn on 7/14/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSAxisDirectionTypes.h"
#import "CRSUnit.h"

/**
 * Axis
 */
@interface CRSAxis : NSObject<CRSIdentifiable>

/**
 *  Name
 */
@property (nonatomic, strong) NSString *name;

/**
 *  Abbreviation
 */
@property (nonatomic, strong) NSString *abbreviation;

/**
 * Axis Direction
 */
@property (nonatomic) enum CRSAxisDirectionType direction;

/**
 *  Meridian
 */
@property (nonatomic, strong) NSDecimalNumber *meridian;

/**
 *  Meridian Text
 */
@property (nonatomic, strong) NSString *meridianText;

/**
 * Meridian (Angle) Unit
 */
@property (nonatomic, strong) CRSUnit *meridianUnit;

/**
 *  Bearing
 */
@property (nonatomic, strong) NSDecimalNumber *bearing;

/**
 *  Bearing Text
 */
@property (nonatomic, strong) NSString *bearingText;

/**
 *  Order
 */
@property (nonatomic, strong) NSNumber *order;

/**
 * Unit
 */
@property (nonatomic, strong) CRSUnit *unit;

/**
 * Identifiers
 */
@property (nonatomic, strong) NSMutableArray<CRSIdentifier *> *identifiers;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSAxis *) create;

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
 * @param direction
 *            axis direction
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andDirection: (enum CRSAxisDirectionType) direction;

/**
 * Has a name
 *
 * @return true if has name
 */
-(BOOL) hasName;

/**
 * Has an abbreviation
 *
 * @return true if has abbreviation
 */
-(BOOL) hasAbbreviation;

/**
 * Has a meridian
 *
 * @return true if has meridian
 */
-(BOOL) hasMeridian;

/**
 * Has a bearing
 *
 * @return true if has bearing
 */
-(BOOL) hasBearing;

/**
 * Has an order
 *
 * @return true if has order
 */
-(BOOL) hasOrder;

/**
 * Has a unit
 *
 * @return true if has unit
 */
-(BOOL) hasUnit;

@end
