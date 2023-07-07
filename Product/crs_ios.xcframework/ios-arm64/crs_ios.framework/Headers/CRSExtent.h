//
//  CRSExtent.h
//  crs-ios
//
//  Created by Brian Osborn on 7/14/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSGeographicBoundingBox.h"
#import "CRSVerticalExtent.h"
#import "CRSTemporalExtent.h"

/**
 * Extent
 */
@interface CRSExtent : NSObject

/**
 *  Area Description
 */
@property (nonatomic, strong) NSString *areaDescription;

/**
 *  Geographic Bounding Box
 */
@property (nonatomic, strong) CRSGeographicBoundingBox *geographicBoundingBox;

/**
 *  Vertical Extent
 */
@property (nonatomic, strong) CRSVerticalExtent *verticalExtent;

/**
 *  Temporal Extent
 */
@property (nonatomic, strong) CRSTemporalExtent *temporalExtent;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSExtent *) create;

/**
 *  Initialize
 *
 *  @return new instance
 */
-(instancetype) init;

/**
 * Has an area description
 *
 * @return true if has area description
 */
-(BOOL) hasAreaDescription;

/**
 * Has a geographic bounding box
 *
 * @return true if has geographic bounding box
 */
-(BOOL) hasGeographicBoundingBox;

/**
 * Has a vertical extent
 *
 * @return true if has vertical extent
 */
-(BOOL) hasVerticalExtent;

/**
 * Has a temporal extent
 *
 * @return true if has temporal extent
 */
-(BOOL) hasTemporalExtent;

@end
