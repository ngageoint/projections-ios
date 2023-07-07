//
//  CRSGeoCoordinateReferenceSystem.h
//  crs-ios
//
//  Created by Brian Osborn on 7/20/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSSimpleCoordinateReferenceSystem.h"
#import "CRSGeoReferenceFrame.h"
#import "CRSGeoDatumEnsemble.h"
#import "CRSDynamic.h"

/**
 * Geodetic and Geographic Coordinate Reference System
 */
@interface CRSGeoCoordinateReferenceSystem : CRSSimpleCoordinateReferenceSystem

/**
 *  Reference Frame
 */
@property (nonatomic, strong) CRSGeoReferenceFrame *referenceFrame;

/**
 *  Datum Ensemble
 */
@property (nonatomic, strong) CRSGeoDatumEnsemble *datumEnsemble;

/**
 *  Dynamic coordinate reference system
 */
@property (nonatomic, strong) CRSDynamic *dynamic;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSGeoCoordinateReferenceSystem *) create;

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
 * @param referenceFrame
 *            reference frame
 * @param coordinateSystem
 *            coordinate system
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andType: (enum CRSType) type andReferenceFrame: (CRSGeoReferenceFrame *) referenceFrame andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param type
 *            coordinate reference system type
 * @param datumEnsemble
 *            datum ensemble
 * @param coordinateSystem
 *            coordinate system
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andType: (enum CRSType) type andDatumEnsemble: (CRSGeoDatumEnsemble *) datumEnsemble andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param type
 *            coordinate reference system type
 * @param dynamic
 *            dynamic
 * @param referenceFrame
 *            reference frame
 * @param coordinateSystem
 *            coordinate system
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andType: (enum CRSType) type andDynamic: (CRSDynamic *) dynamic andReferenceFrame: (CRSGeoReferenceFrame *) referenceFrame andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem;

/**
 * Determine if has a reference frame
 *
 * @return true if has reference frame
 */
-(BOOL) hasReferenceFrame;

/**
 * Determine if has a datum ensemble
 *
 * @return true if has datum ensemble
 */
-(BOOL) hasDatumEnsemble;

/**
 * Determine if has a dynamic
 *
 * @return true if has dynamic
 */
-(BOOL) hasDynamic;

/**
 * Get the geodetic or geographic common datum
 *
 * @return geo datum
 */
-(NSObject<CRSGeoDatum> *) geoDatum;

@end
