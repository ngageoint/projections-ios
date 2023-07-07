//
//  CRSEngineeringCoordinateReferenceSystem.h
//  crs-ios
//
//  Created by Brian Osborn on 7/20/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSSimpleCoordinateReferenceSystem.h"
#import "CRSEngineeringDatum.h"

/**
 * Engineering Coordinate Reference System
 */
@interface CRSEngineeringCoordinateReferenceSystem : CRSSimpleCoordinateReferenceSystem

/**
 *  Engineering Datum
 */
@property (nonatomic, strong) CRSEngineeringDatum *datum;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSEngineeringCoordinateReferenceSystem *) create;

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
 * @param engineeringDatum
 *            engineering datum
 * @param coordinateSystem
 *            coordinate system
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andDatum: (CRSEngineeringDatum *) engineeringDatum andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem;

@end
