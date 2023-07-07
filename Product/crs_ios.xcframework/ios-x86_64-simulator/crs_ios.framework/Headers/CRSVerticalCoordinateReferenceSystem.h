//
//  CRSVerticalCoordinateReferenceSystem.h
//  crs-ios
//
//  Created by Brian Osborn on 7/21/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSSimpleCoordinateReferenceSystem.h"
#import "CRSVerticalReferenceFrame.h"
#import "CRSVerticalDatumEnsemble.h"
#import "CRSDynamic.h"

/**
 * Vertical Coordinate Reference System
 */
@interface CRSVerticalCoordinateReferenceSystem : CRSSimpleCoordinateReferenceSystem

/**
 *  Vertical Reference Frame
 */
@property (nonatomic, strong) CRSVerticalReferenceFrame *referenceFrame;

/**
 *  Vertical Datum Ensemble
 */
@property (nonatomic, strong) CRSVerticalDatumEnsemble *datumEnsemble;

/**
 *  Dynamic coordinate reference system
 */
@property (nonatomic, strong) CRSDynamic *dynamic;

/**
 *  Geoid Model Name
 */
@property (nonatomic, strong) NSString *geoidModelName;

/**
 * Identifiers
 */
@property (nonatomic, strong) CRSIdentifier *geoidModelIdentifier;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSVerticalCoordinateReferenceSystem *) create;

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
 * @param referenceFrame
 *            vertical reference frame
 * @param coordinateSystem
 *            coordinate system
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andReferenceFrame: (CRSVerticalReferenceFrame *) referenceFrame andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param datumEnsemble
 *            vertical datum ensemble
 * @param coordinateSystem
 *            coordinate system
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andDatumEnsemble: (CRSVerticalDatumEnsemble *) datumEnsemble andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param dynamic
 *            dynamic
 * @param referenceFrame
 *            vertical reference frame
 * @param coordinateSystem
 *            coordinate system
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andDynamic: (CRSDynamic *) dynamic andReferenceFrame: (CRSVerticalReferenceFrame *) referenceFrame andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem;

/**
 * Determine if has a vertical reference frame
 *
 * @return true if has vertical reference frame
 */
-(BOOL) hasReferenceFrame;

/**
 * Determine if has a vertical datum ensemble
 *
 * @return true if has vertical datum ensemble
 */
-(BOOL) hasDatumEnsemble;

/**
 * Determine if has a dynamic
 *
 * @return true if has dynamic
 */
-(BOOL) hasDynamic;

/**
 * Has a geoid model name
 *
 * @return true if has geoid model name
 */
-(BOOL) hasGeoidModelName;

/**
 * Has a geoid model identifier
 *
 * @return true if has geoid model identifier
 */
-(BOOL) hasGeoidModelIdentifier;

@end
