//
//  CRSEllipsoidTypes.h
//  crs-ios
//
//  Created by Brian Osborn on 7/21/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Ellipsoid Type
 */
enum CRSEllipsoidType{
    CRS_ELLIPSOID_OBLATE,
    CRS_ELLIPSOID_TRIAXIAL
};

/**
 * Ellipsoid Type names
 */
extern NSString * const CRS_ELLIPSOID_OBLATE_NAME;
extern NSString * const CRS_ELLIPSOID_TRIAXIAL_NAME;

/**
 * Ellipsoid Type
 */
@interface CRSEllipsoidTypes : NSObject

/**
 * Get the type name
 *
 * @param type
 *            type
 * @return type name
 */
+(NSString *) name: (enum CRSEllipsoidType) type;

/**
 * Get the type from the name
 *
 * @param name
 *            type name
 * @return type
 */
+(enum CRSEllipsoidType) type: (NSString *) name;

@end
