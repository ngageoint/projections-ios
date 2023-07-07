//
//  CRSCoordinateReferenceSystem.h
//  crs-ios
//
//  Created by Brian Osborn on 7/14/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSCommon.h"

/**
 * Coordinate Reference System
 */
@interface CRSCoordinateReferenceSystem : CRSCommon

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
 *            coordinate reference system type
 *
 *  @return new instance
 */
-(instancetype) initWithType: (enum CRSType) type;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param type
 *            coordinate reference system type
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andType: (enum CRSType) type;

@end
