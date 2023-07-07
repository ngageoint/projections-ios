//
//  CRSPrimeMeridians.h
//  crs-ios
//
//  Created by Brian Osborn on 9/2/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Common Prime Meridians
 */
enum CRSPrimeMeridianType{
    CRS_PM_GREENWICH,
    CRS_PM_LISBON,
    CRS_PM_PARIS,
    CRS_PM_BOGOTA,
    CRS_PM_MADRID,
    CRS_PM_ROME,
    CRS_PM_BERN,
    CRS_PM_JAKARTA,
    CRS_PM_FERRO,
    CRS_PM_BRUSSELS,
    CRS_PM_STOCKHOLM,
    CRS_PM_ATHENS,
    CRS_PM_OSLO,
};

/**
 * Prime Meridians
 */
@interface CRSPrimeMeridians : NSObject

/**
 * Get a prime meridian by type
 *
 * @param type
 *            prime meridian type
 * @return prime meridian
 */
+(CRSPrimeMeridians *) fromType: (enum CRSPrimeMeridianType) type;

/**
 * Get a prime meridian by name
 *
 * @param name
 *            name
 * @return prime meridian or nil
 */
+(CRSPrimeMeridians *) fromName: (NSString *) name;

/**
 * Get the type
 *
 * @return type
 */
-(enum CRSPrimeMeridianType) type;

/**
 * Get the name
 *
 * @return name
 */
-(NSString *) name;

/**
 * Get the offset from greenwich in radians
 *
 * @return offset longitude in radians
 */
-(double) offsetFromGreenwich;

/**
 * Get the offset from greenwich in degrees
 *
 * @return offset longitude in degrees
 */
-(double) offsetFromGreenwichDegrees;

@end
