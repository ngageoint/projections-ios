//
//  CRSPointMotionOperation.h
//  crs-ios
//
//  Created by Brian Osborn on 7/19/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSSimpleOperation.h"

/**
 * Point Motion Operation
 */
@interface CRSPointMotionOperation : CRSSimpleOperation

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSPointMotionOperation *) create;

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
 * @param method
 *            operation method
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andSource: (CRSCoordinateReferenceSystem *) source andMethod: (CRSOperationMethod *) method;

@end
