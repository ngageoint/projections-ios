//
//  CRSCoordinateOperation.h
//  crs-ios
//
//  Created by Brian Osborn on 7/19/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSSimpleOperation.h"

/**
 * Coordinate Operation
 */
@interface CRSCoordinateOperation : CRSSimpleOperation

/**
 * Target Coordinate Reference System
 */
@property (nonatomic, strong) CRSCoordinateReferenceSystem *target;

/**
 * Interpolation Coordinate Reference System
 */
@property (nonatomic, strong) CRSCoordinateReferenceSystem *interpolation;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSCoordinateOperation *) create;

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
 * @param source
 *            source crs
 * @param target
 *            target crs
 * @param method
 *            operation method
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andSource: (CRSCoordinateReferenceSystem *) source andTarget: (CRSCoordinateReferenceSystem *) target andMethod: (CRSOperationMethod *) method;

/**
 * Has an interpolation coordinate reference system
 *
 * @return true if has interpolation crs
 */
-(BOOL) hasInterpolation;

@end
