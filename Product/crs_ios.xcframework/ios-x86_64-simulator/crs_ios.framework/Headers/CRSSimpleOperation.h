//
//  CRSSimpleOperation.h
//  crs-ios
//
//  Created by Brian Osborn on 7/19/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSOperation.h"
#import "CRSCommonOperation.h"

/**
 * Simple Operation
 */
@interface CRSSimpleOperation : CRSOperation<CRSCommonOperation>

/**
 *  Operation Method
 */
@property (nonatomic, strong) CRSOperationMethod *method;

/**
 *  Initialize
 *
 * @param type
 *            crs operation type
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
 *            crs operation type
 * @param source
 *            source crs
 * @param method
 *            operation method     
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andType: (enum CRSType) type andSource: (CRSCoordinateReferenceSystem *) source andMethod: (CRSOperationMethod *) method;

@end
