//
//  CRSParametricCoordinateReferenceSystem.h
//  crs-ios
//
//  Created by Brian Osborn on 7/20/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSSimpleCoordinateReferenceSystem.h"
#import "CRSParametricDatum.h"

/**
 * Parametric Coordinate Reference System
 */
@interface CRSParametricCoordinateReferenceSystem : CRSSimpleCoordinateReferenceSystem

/**
 *  Parametric Datum
 */
@property (nonatomic, strong) CRSParametricDatum *datum;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSParametricCoordinateReferenceSystem *) create;

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
 * @param parametricDatum
 *            parametric datum
 * @param coordinateSystem
 *            coordinate system
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andDatum: (CRSParametricDatum *) parametricDatum andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem;

@end
