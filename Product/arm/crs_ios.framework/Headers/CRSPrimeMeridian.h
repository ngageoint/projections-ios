//
//  CRSPrimeMeridian.h
//  crs-ios
//
//  Created by Brian Osborn on 7/21/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSUnit.h"

/**
 * Prime Meridian
 */
@interface CRSPrimeMeridian : NSObject<CRSIdentifiable>

/**
 *  Name
 */
@property (nonatomic, strong) NSString *name;

/**
 *  International Reference Meridian longitude
 */
@property (nonatomic) double longitude;

/**
 *  International Reference Meridian longitude Text
 */
@property (nonatomic, strong) NSString *longitudeText;

/**
 * International Reference Meridian longitude unit (angle)
 */
@property (nonatomic, strong) CRSUnit *longitudeUnit;

/**
 * Identifiers
 */
@property (nonatomic, strong) NSMutableArray<CRSIdentifier *> *identifiers;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSPrimeMeridian *) create;

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
 * @param longitude
 *            International Reference Meridian longitude
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andLongitude: (double) longitude;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param longitude
 *            International Reference Meridian longitude
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andLongitudeText: (NSString *) longitude;

/**
 * Has an International Reference Meridian longitude unit (angle)
 *
 * @return true if has International Reference Meridian longitude unit
 *         (angle)
 */
-(BOOL) hasLongitudeUnit;

@end
