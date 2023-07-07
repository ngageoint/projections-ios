//
//  CRSEllipsoid.h
//  crs-ios
//
//  Created by Brian Osborn on 7/21/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSEllipsoidTypes.h"
#import "CRSUnit.h"

/**
 * Ellipsoid
 */
@interface CRSEllipsoid : NSObject<CRSIdentifiable>

/**
 *  Name
 */
@property (nonatomic, strong) NSString *name;

/**
 *  Semi Major Axis
 */
@property (nonatomic) double semiMajorAxis;

/**
 *  Semi Major Axis Text
 */
@property (nonatomic, strong) NSString *semiMajorAxisText;

/**
 *  Inverse Flattening
 */
@property (nonatomic) double inverseFlattening;

/**
 *  Inverse Flattening Text
 */
@property (nonatomic, strong) NSString *inverseFlatteningText;

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
+(CRSEllipsoid *) create;

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
 * @param inverseFlattening
 *            inverse flattening
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andSemiMajorAxis: (double) semiMajorAxis andInverseFlattening: (double) inverseFlattening;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param semiMajorAxis
 *            semi major axis
 * @param inverseFlattening
 *            inverse flattening
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andSemiMajorAxisText: (NSString *) semiMajorAxis andInverseFlatteningText: (NSString *) inverseFlattening;

/**
 * Get the Ellipsoid Type
 *
 * @return ellipsoid type
 */
-(enum CRSEllipsoidType) type;

/**
 * Has a unit (length)
 *
 * @return true if has unit (length)
 */
-(BOOL) hasUnit;

/**
 *  Get the pole radius
 *
 *  @return pole radius
 */
-(double) poleRadius;

/**
 *  Get the pole radius as text
 *
 *  @return pole radius
 */
-(NSString *) poleRadiusText;

@end
