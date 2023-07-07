//
//  CRSTriaxialEllipsoid.h
//  crs-ios
//
//  Created by Brian Osborn on 7/22/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSEllipsoid.h"

/**
 * Triaxial Ellipsoid
 */
@interface CRSTriaxialEllipsoid : CRSEllipsoid

/**
 *  Semi Median Axis
 */
@property (nonatomic) double semiMedianAxis;

/**
 *  Semi Median Axis Text
 */
@property (nonatomic, strong) NSString *semiMedianAxisText;

/**
 *  Semi Minor Axis
 */
@property (nonatomic) double semiMinorAxis;

/**
 *  Semi Minor Axis Text
 */
@property (nonatomic, strong) NSString *semiMinorAxisText;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSTriaxialEllipsoid *) create;

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
 * @param semiMajorAxis
 *            semi major axis
 * @param semiMedianAxis
 *            semi major axis
 * @param semiMinorAxis
 *            semi minor axis
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andSemiMajorAxis: (double) semiMajorAxis andSemiMedianAxis: (double) semiMedianAxis andSemiMinorAxis: (double) semiMinorAxis;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param semiMajorAxis
 *            semi major axis
 * @param semiMedianAxis
 *            semi major axis
 * @param semiMinorAxis
 *            semi minor axis
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andSemiMajorAxisText: (NSString *) semiMajorAxis andSemiMedianAxisText: (NSString *) semiMedianAxis andSemiMinorAxisText: (NSString *) semiMinorAxis;

@end
