//
//  CRSGeoDatumEnsemble.h
//  crs-ios
//
//  Created by Brian Osborn on 7/20/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSDatumEnsemble.h"
#import "CRSGeoDatum.h"

/**
 * Geodetic and Geographic Datum Ensemble
 */
@interface CRSGeoDatumEnsemble : CRSDatumEnsemble<CRSGeoDatum>

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
+(CRSGeoDatumEnsemble *) create;

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
 * @param member
 *            member
 * @param ellipsoid
 *            ellipsoid
 * @param accuracy
 *            accuracy
 * @param primeMeridian
 *            prime meridian
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andMember: (CRSDatumEnsembleMember *) member andEllipsoid: (CRSEllipsoid *) ellipsoid andAccuracy: (double) accuracy andPrimeMeridian: (CRSPrimeMeridian *) primeMeridian;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param members
 *            members
 * @param ellipsoid
 *            ellipsoid
 * @param accuracy
 *            accuracy
 * @param primeMeridian
 *            prime meridian
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andMembers: (NSArray<CRSDatumEnsembleMember *> *) members andEllipsoid: (CRSEllipsoid *) ellipsoid andAccuracy: (double) accuracy andPrimeMeridian: (CRSPrimeMeridian *) primeMeridian;

@end
