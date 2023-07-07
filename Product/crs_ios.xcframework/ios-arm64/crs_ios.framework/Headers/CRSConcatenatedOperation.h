//
//  CRSConcatenatedOperation.h
//  crs-ios
//
//  Created by Brian Osborn on 7/19/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSOperation.h"
#import "CRSCommonOperation.h"

/**
 * Concatenated Operation
 */
@interface CRSConcatenatedOperation : CRSOperation

/**
 * Target Coordinate Reference System
 */
@property (nonatomic, strong) CRSCoordinateReferenceSystem *target;

/**
 * Operations, transformations, and conversions
 */
@property (nonatomic, strong) NSMutableArray<NSObject<CRSCommonOperation> *> *operations;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSConcatenatedOperation *) create;

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
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andSource: (CRSCoordinateReferenceSystem *) source andTarget: (CRSCoordinateReferenceSystem *) target;

/**
 * Number of operations
 *
 * @return operations count
 */
-(int) numOperations;

/**
 * Get the operation at the index
 *
 * @param index
 *            operation index
 * @return operation
 */
-(NSObject<CRSCommonOperation> *) operationAtIndex: (int) index;

/**
 * Add the operation
 *
 * @param operation
 *            operation
 */
-(void) addOperation: (NSObject<CRSCommonOperation> *) operation;

/**
 * Add the operations
 *
 * @param operations
 *            operations
 */
-(void) addOperations: (NSArray<NSObject<CRSCommonOperation> *> *) operations;

@end
