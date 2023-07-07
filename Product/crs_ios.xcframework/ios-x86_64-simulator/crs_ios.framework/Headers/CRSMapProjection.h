//
//  CRSMapProjection.h
//  crs-ios
//
//  Created by Brian Osborn on 7/20/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSCommonOperation.h"

/**
 * Map Projection
 */
@interface CRSMapProjection : NSObject<CRSCommonOperation>

/**
 *  Name
 */
@property (nonatomic, strong) NSString *name;

/**
 *  Method
 */
@property (nonatomic, strong) CRSOperationMethod *method;

/**
 * Identifiers
 */
@property (nonatomic, strong) NSMutableArray<CRSIdentifier *> *identifiers;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSMapProjection *) create;

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
 * @param method
 *            method
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andMethod: (CRSOperationMethod *) method;

@end
