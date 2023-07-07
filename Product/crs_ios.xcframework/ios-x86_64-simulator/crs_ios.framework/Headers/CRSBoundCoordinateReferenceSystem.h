//
//  CRSBoundCoordinateReferenceSystem.h
//  crs-ios
//
//  Created by Brian Osborn on 7/19/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSCoordinateReferenceSystem.h"
#import "CRSAbridgedCoordinateTransformation.h"

/**
 * Bound Coordinate Reference System
 */
@interface CRSBoundCoordinateReferenceSystem : CRSCoordinateReferenceSystem

/**
 * Source Coordinate Reference System
 */
@property (nonatomic, strong) CRSCoordinateReferenceSystem *source;

/**
 * Target Coordinate Reference System
 */
@property (nonatomic, strong) CRSCoordinateReferenceSystem *target;

/**
 * Abridged Coordinate Transformation
 */
@property (nonatomic, strong) CRSAbridgedCoordinateTransformation *transformation;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSBoundCoordinateReferenceSystem *) create;

/**
 *  Initialize
 *
 *  @return new instance
 */
-(instancetype) init;

/**
 *  Initialize
 *
 * @param source
 *            source crs
 * @param target
 *            target crs
 * @param transformation
 *            abridged coordinate transformation
 *
 *  @return new instance
 */
-(instancetype) initWithSource: (CRSCoordinateReferenceSystem *) source andTarget: (CRSCoordinateReferenceSystem *) target andTransformation: (CRSAbridgedCoordinateTransformation *) transformation;

@end
