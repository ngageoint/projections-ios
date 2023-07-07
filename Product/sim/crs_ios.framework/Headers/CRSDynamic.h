//
//  CRSDynamic.h
//  crs-ios
//
//  Created by Brian Osborn on 7/15/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSIdentifiable.h"

/**
 * Dynamic Coordinate Reference System
 */
@interface CRSDynamic : NSObject<CRSIdentifiable>

/**
 * Reference Epoch
 */
@property (nonatomic) double referenceEpoch;

/**
 *  Reference Epoch Text
 */
@property (nonatomic, strong) NSString *referenceEpochText;

/**
 *  Deformation Model Name
 */
@property (nonatomic, strong) NSString *deformationModelName;

/**
 * Deformation Model Identifiers
 */
@property (nonatomic, strong) NSMutableArray<CRSIdentifier *> *identifiers;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSDynamic *) create;

/**
 *  Initialize
 *
 *  @return new instance
 */
-(instancetype) init;

/**
 *  Initialize
 *
 * @param referenceEpoch
 *            reference epoch
 *
 *  @return new instance
 */
-(instancetype) initWithReferenceEpoch: (double) referenceEpoch;

/**
 *  Initialize
 *
 * @param referenceEpoch
 *            reference epoch
 *
 *  @return new instance
 */
-(instancetype) initWithReferenceEpochText: (NSString *) referenceEpoch;

/**
 * Has a deformation model name
 *
 * @return true if has deformation model name
 */
-(BOOL) hasDeformationModelName;

@end
