//
//  CRSGeoDatum.h
//  crs-ios
//
//  Created by Brian Osborn on 7/20/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#ifndef CRSGeoDatum_h
#define CRSGeoDatum_h

#import "CRSEllipsoid.h"
#import "CRSPrimeMeridian.h"

/**
 *  Common Operation interface
 */
@protocol CRSGeoDatum <CRSIdentifiable>

/**
 * Get the datum name
 *
 * @return datum name
 */
-(NSString *) name;

/**
 * Set the datum name
 *
 * @param name
 *            datum name
 */
-(void) setName: (NSString *) name;

/**
 * Get the ellipsoid
 *
 * @return ellipsoid
 */
-(CRSEllipsoid *) ellipsoid;

/**
 * Set the ellipsoid
 *
 * @param ellipsoid
 *            ellipsoid
 */
-(void) setEllipsoid: (CRSEllipsoid *) ellipsoid;

/**
 * Get the prime meridian
 *
 * @return prime meridian
 */
-(CRSPrimeMeridian *) primeMeridian;

/**
 * Has a prime meridian
 *
 * @return true if has prime meridian
 */
-(BOOL) hasPrimeMeridian;

/**
 * Set the prime meridian
 *
 * @param primeMeridian
 *            prime meridian
 */
-(void) setPrimeMeridian: (CRSPrimeMeridian *) primeMeridian;

@end

#endif /* CRSGeoDatum_h */
