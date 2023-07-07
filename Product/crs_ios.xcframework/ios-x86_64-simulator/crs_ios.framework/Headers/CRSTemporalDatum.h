//
//  CRSTemporalDatum.h
//  crs-ios
//
//  Created by Brian Osborn on 7/20/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSIdentifiable.h"
#import "CRSDateTime.h"

@interface CRSTemporalDatum : NSObject<CRSIdentifiable>

/**
 *  Datum Name
 */
@property (nonatomic, strong) NSString *name;

/**
 *  Calendar Identifier
 */
@property (nonatomic, strong) NSString *calendar;

/**
 *  Origin Description
 */
@property (nonatomic, strong) NSString *origin;

/**
 *  Origin Description date time
 */
@property (nonatomic, strong) CRSDateTime *originDateTime;

/**
 * Identifiers
 */
@property (nonatomic, strong) NSMutableArray<CRSIdentifier *> *identifiers;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSTemporalDatum *) create;

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

/**
 * Has a calendar identifier
 *
 * @return true if has calendar identifier
 */
-(BOOL) hasCalendar;

/**
 * Has an origin
 *
 * @return true if has origin
 */
-(BOOL) hasOrigin;

/**
 * Has an origin date time
 *
 * @return true if has origin date time
 */
-(BOOL) hasOriginDateTime;

/**
 * Set the origin date time
 *
 * @param origin
 *            origin date time
 */
-(void) setOriginDateTimeWithOrigin: (NSString *) origin;

@end
