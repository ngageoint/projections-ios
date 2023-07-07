//
//  CRSGeoReferenceFrame.h
//  crs-ios
//
//  Created by Brian Osborn on 7/20/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSReferenceFrame.h"
#import "CRSGeoDatum.h"

/**
 * Geodetic and Geographic Reference Frame (datum)
 */
@interface CRSGeoReferenceFrame : CRSReferenceFrame<CRSGeoDatum>

/**
 * Ellipsoid
 */
@property (nonatomic, strong) CRSEllipsoid *ellipsoid;

/**
 * Prime Meridian
 */
@property (nonatomic, strong) CRSPrimeMeridian *primeMeridian;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSGeoReferenceFrame *) create;

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
 *            geo crs type
 *
 *  @return new instance
 */
-(instancetype) initWithType: (enum CRSType) type;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param ellipsoid
 *            ellipsoid
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andEllipsoid: (CRSEllipsoid *) ellipsoid;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param type
 *            geo crs type
 * @param ellipsoid
 *            ellipsoid
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andType: (enum CRSType) type andEllipsoid: (CRSEllipsoid *) ellipsoid;

@end
