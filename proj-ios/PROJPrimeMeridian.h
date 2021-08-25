//
//  PROJPrimeMeridian.h
//  proj-ios
//
//  Created by Brian Osborn on 8/25/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Prime Meridian Types
 */
enum PROJPrimeMeridianType{
    PROJ_PM_GREENWICH,
    PROJ_PM_LISBON,
    PROJ_PM_PARIS,
    PROJ_PM_BOGOTA,
    PROJ_PM_MADRID,
    PROJ_PM_ROME,
    PROJ_PM_BERN,
    PROJ_PM_JAKARTA,
    PROJ_PM_FERRO,
    PROJ_PM_BRUSSELS,
    PROJ_PM_STOCKHOLM,
    PROJ_PM_ATHENS,
    PROJ_PM_OSLO,
};

/**
 * Prime Meridian
 */
@interface PROJPrimeMeridian : NSObject

/**
 * Get a prime meridian by type
 *
 * @param type
 *            prime meridian type
 * @return prime meridian
 */
+(PROJPrimeMeridian *) fromType: (enum PROJPrimeMeridianType) type;

/**
 * Get a prime meridian by name
 *
 * @param name
 *            name
 * @return prime meridian or nil
 */
+(PROJPrimeMeridian *) fromName: (NSString *) name;

/**
 * Get the type
 *
 * @return type
 */
-(enum PROJPrimeMeridianType) type;

/**
 * Get the name
 *
 * @return name
 */
-(NSString *) name;

/**
 * Get the offset from greenwich
 *
 * @return offset from greenwich
 */
-(double) offsetFromGreenwich;

@end
