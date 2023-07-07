//
//  CRSCommon.h
//  crs-ios
//
//  Created by Brian Osborn on 7/14/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSObject.h"

/**
 * Common coordinate reference system and coordinate operations object
 */
@interface CRSCommon : CRSObject<CRSIdentifiable>

/**
 *  Name
 */
@property (nonatomic, strong) NSString *name;

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
 *  Initialize
 *
 *  @return new instance
 */
-(instancetype) init;

/**
 *  Initialize
 *
 * @param type
 *            coordinate reference system type
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
 *            coordinate reference system type
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andType: (enum CRSType) type;

@end
