//
//  CRSOperation.h
//  crs-ios
//
//  Created by Brian Osborn on 7/19/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSCoordinateReferenceSystem.h"

/**
 * Common Operation
 */
@interface CRSOperation : CRSCommon

/**
 *  Operation Version
 */
@property (nonatomic, strong) NSString *version;

/**
 * Source Coordinate Reference System
 */
@property (nonatomic, strong) CRSCoordinateReferenceSystem *source;

/**
 *  Coordinate operation accuracy
 */
@property (nonatomic, strong) NSDecimalNumber *accuracy;

/**
 *  Coordinate operation accuracy Text
 */
@property (nonatomic, strong) NSString *accuracyText;

/**
 *  Initialize
 *
 * @param type
 *            crs operation type
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
 *            crs operation type
 * @param source
 *            source crs
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andType: (enum CRSType) type andSource: (CRSCoordinateReferenceSystem *) source;

/**
 * Has an operation version
 *
 * @return true if has operation version
 */
-(BOOL) hasVersion;

/**
 * Has a coordinate operation accuracy
 *
 * @return true if has coordinate operation accuracy
 */
-(BOOL) hasAccuracy;

@end
