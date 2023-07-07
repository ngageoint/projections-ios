//
//  CRSTemporalCoordinateReferenceSystem.h
//  crs-ios
//
//  Created by Brian Osborn on 7/20/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSSimpleCoordinateReferenceSystem.h"
#import "CRSTemporalDatum.h"

/**
 * Temporal Coordinate Reference System
 */
@interface CRSTemporalCoordinateReferenceSystem : CRSSimpleCoordinateReferenceSystem

/**
 *  Temporal Datum
 */
@property (nonatomic, strong) CRSTemporalDatum *datum;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSTemporalCoordinateReferenceSystem *) create;

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
 * @param temporalDatum
 *            temporal datum
 * @param coordinateSystem
 *            coordinate system
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andDatum: (CRSTemporalDatum *) temporalDatum andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem;

@end
