//
//  CRSVerticalReferenceFrame.h
//  crs-ios
//
//  Created by Brian Osborn on 7/21/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSReferenceFrame.h"

/**
 * Vertical Reference Frame (datum)
 */
@interface CRSVerticalReferenceFrame : CRSReferenceFrame

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSVerticalReferenceFrame *) create;

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
