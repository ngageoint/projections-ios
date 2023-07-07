//
//  CRSVerticalExtent.h
//  crs-ios
//
//  Created by Brian Osborn on 7/13/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSUnit.h"

/**
 * Vertical Extent
 */
@interface CRSVerticalExtent : NSObject

/**
 *  Minimum Height
 */
@property (nonatomic) double minimumHeight;

/**
 *  Minimum Height Text
 */
@property (nonatomic, strong) NSString *minimumHeightText;

/**
 *  Maximum Height
 */
@property (nonatomic) double maximumHeight;

/**
 *  Maximum Height Text
 */
@property (nonatomic, strong) NSString *maximumHeightText;

/**
 * Unit (Length)
 */
@property (nonatomic, strong) CRSUnit *unit;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSVerticalExtent *) create;

/**
 *  Initialize
 *
 *  @return new instance
 */
-(instancetype) init;

/**
 *  Initialize
 *
 * @param minimumHeight
 *            minimum height
 * @param maximumHeight
 *            maximum height
 *
 *  @return new instance
 */
-(instancetype) initWithMinimumHeight: (double) minimumHeight andMaximumHeight: (double) maximumHeight;

/**
 *  Initialize
 *
 * @param minimumHeight
 *            minimum height
 * @param maximumHeight
 *            maximum height
 *
 *  @return new instance
 */
-(instancetype) initWithMinimumHeightText: (NSString *) minimumHeight andMaximumHeightText: (NSString *) maximumHeight;

/**
 *  Initialize
 *
 * @param minimumHeight
 *            minimum height
 * @param maximumHeight
 *            maximum height
 * @param unit
 *            unit (length)
 *
 *  @return new instance
 */
-(instancetype) initWithMinimumHeight: (double) minimumHeight andMaximumHeight: (double) maximumHeight andUnit: (CRSUnit *) unit;

/**
 *  Initialize
 *
 * @param minimumHeight
 *            minimum height
 * @param maximumHeight
 *            maximum height
 * @param unit
 *            unit (length)
 *
 *  @return new instance
 */
-(instancetype) initWithMinimumHeightText: (NSString *) minimumHeight andMaximumHeightText: (NSString *) maximumHeight andUnit: (CRSUnit *) unit;

/**
 * Has a unit (length)
 *
 * @return true if has unit (length)
 */
-(BOOL) hasUnit;

@end
