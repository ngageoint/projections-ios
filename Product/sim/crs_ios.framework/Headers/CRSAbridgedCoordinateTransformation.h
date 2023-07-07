//
//  CRSAbridgedCoordinateTransformation.h
//  crs-ios
//
//  Created by Brian Osborn on 7/19/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSCommonOperation.h"
#import "CRSScopeExtentIdentifierRemark.h"

/**
 * Abridged Coordinate Transformation
 */
@interface CRSAbridgedCoordinateTransformation : NSObject<CRSCommonOperation, CRSScopeExtentIdentifierRemark>

/**
 *  Name
 */
@property (nonatomic, strong) NSString *name;

/**
 *  Operation Version
 */
@property (nonatomic, strong) NSString *version;

/**
 *  Operation Method
 */
@property (nonatomic, strong) CRSOperationMethod *method;

/**
 * Usages
 */
@property (nonatomic, strong) NSMutableArray<CRSUsage *> *usages;

/**
 * Identifiers
 */
@property (nonatomic, strong) NSMutableArray<CRSIdentifier *> *identifiers;

/**
 *  Remark
 */
@property (nonatomic, strong) NSString *remark;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSAbridgedCoordinateTransformation *) create;

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
 *            operation method
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andMethod: (CRSOperationMethod *) method;

@end
