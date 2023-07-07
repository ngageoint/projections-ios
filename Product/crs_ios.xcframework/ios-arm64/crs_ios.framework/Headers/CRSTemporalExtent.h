//
//  CRSTemporalExtent.h
//  crs-ios
//
//  Created by Brian Osborn on 7/14/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSDateTime.h"

/**
 * Temporal Extent
 */
@interface CRSTemporalExtent : NSObject

/**
 *  Start
 */
@property (nonatomic, strong) NSString *start;

/**
 *  Start date time
 */
@property (nonatomic, strong) CRSDateTime *startDateTime;

/**
 *  End
 */
@property (nonatomic, strong) NSString *end;

/**
 *  End date time
 */
@property (nonatomic, strong) CRSDateTime *endDateTime;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSTemporalExtent *) create;

/**
 *  Initialize
 *
 *  @return new instance
 */
-(instancetype) init;

/**
 *  Initialize
 *
 * @param start
 *            start
 * @param end
 *            end
 *
 *  @return new instance
 */
-(instancetype) initWithStart: (NSString *) start andEnd: (NSString *) end;

/**
 *  Initialize
 *
 * @param start
 *            start
 * @param end
 *            end
 *
 *  @return new instance
 */
-(instancetype) initWithStartDateTime: (CRSDateTime *) start andEndDateTime: (CRSDateTime *) end;

/**
 * Has a start date time
 *
 * @return true if has start date time
 */
-(BOOL) hasStartDateTime;

/**
 * Set the start date time
 *
 * @param start
 *            start date time
 */
-(void) setStartDateTimeWithStart: (NSString *) start;

/**
 * Has an end date time
 *
 * @return true if has end date time
 */
-(BOOL) hasEndDateTime;

/**
 * Set the end date time
 *
 * @param end
 *            end date time
 */
-(void) setEndDateTimeWithEnd: (NSString *) end;

@end
