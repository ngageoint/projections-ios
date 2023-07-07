//
//  CRSParametricDatum.h
//  crs-ios
//
//  Created by Brian Osborn on 7/20/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSReferenceFrame.h"

/**
 * Parametric Datum
 */
@interface CRSParametricDatum : CRSReferenceFrame

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSParametricDatum *) create;

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
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name;

@end
