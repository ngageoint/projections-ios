//
//  CRSUsage.h
//  crs-ios
//
//  Created by Brian Osborn on 7/14/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSExtent.h"

/**
 * Usage
 */
@interface CRSUsage : NSObject

/**
 *  Scope
 */
@property (nonatomic, strong) NSString *scope;

/**
 *  Extent
 */
@property (nonatomic, strong) CRSExtent *extent;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSUsage *) create;

/**
 *  Initialize
 *
 *  @return new instance
 */
-(instancetype) init;

/**
 *  Initialize
 *
 * @param scope
 *            scope
 * @param extent
 *            extent
 *
 *  @return new instance
 */
-(instancetype) initWithScope: (NSString *) scope andExtent: (CRSExtent *) extent;

@end
