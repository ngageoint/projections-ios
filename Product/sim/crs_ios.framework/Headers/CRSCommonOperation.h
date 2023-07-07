//
//  CRSCommonOperation.h
//  crs-ios
//
//  Created by Brian Osborn on 7/19/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#ifndef CRSCommonOperation_h
#define CRSCommonOperation_h

#import "CRSOperationMethod.h"

/**
 *  Common Operation interface
 */
@protocol CRSCommonOperation <CRSIdentifiable>

/**
 * Get the operation type
 *
 * @return operation type
 */
-(enum CRSOperationType) operationType;

/**
 * Get the name
 *
 * @return name
 */
-(NSString *) name;

/**
 * Set the name
 *
 * @param name
 *            name
 */
-(void) setName: (NSString *) name;

/**
 * Get the operation version
 *
 * @return operation version
 */
-(NSString *) version;

/**
 * Has an operation version
 *
 * @return true if has operation version
 */
-(BOOL) hasVersion;

/**
 * Set the operation version
 *
 * @param version
 *            operation version
 */
-(void) setVersion: (NSString *) version;

/**
 * Get the method
 *
 * @return method
 */
-(CRSOperationMethod *) method;

/**
 * Set the method
 *
 * @param method
 *            method
 */
-(void) setMethod: (CRSOperationMethod *) method;

@end

#endif /* CRSCommonOperation_h */
