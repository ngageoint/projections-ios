//
//  CRSProjectedCoordinateReferenceSystem.h
//  crs-ios
//
//  Created by Brian Osborn on 7/20/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSGeoCoordinateReferenceSystem.h"
#import "CRSMapProjection.h"

/**
 * Projected Coordinate Reference System
 */
@interface CRSProjectedCoordinateReferenceSystem : CRSSimpleCoordinateReferenceSystem

/**
 *  Base
 */
@property (nonatomic, strong) CRSGeoCoordinateReferenceSystem *base;

/**
 *  Map Projection
 */
@property (nonatomic, strong) CRSMapProjection *mapProjection;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSProjectedCoordinateReferenceSystem *) create;

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
 * @param baseName
 *            base CRS name
 * @param baseType
 *            base coordinate reference system type
 * @param referenceFrame
 *            reference frame
 * @param mapProjection
 *            map projection
 * @param coordinateSystem
 *            coordinate system
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andBaseName: (NSString *) baseName andBaseType: (enum CRSType) baseType andReferenceFrame: (CRSGeoReferenceFrame *) referenceFrame andMapProjection: (CRSMapProjection *) mapProjection andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param baseName
 *            base CRS name
 * @param baseType
 *            base coordinate reference system type
 * @param datumEnsemble
 *            datum ensemble
 * @param mapProjection
 *            map projection
 * @param coordinateSystem
 *            coordinate system
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andBaseName: (NSString *) baseName andBaseType: (enum CRSType) baseType andDatumEnsemble: (CRSGeoDatumEnsemble *) datumEnsemble andMapProjection: (CRSMapProjection *) mapProjection andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param baseName
 *            base CRS name
 * @param baseType
 *            base coordinate reference system type
 * @param dynamic
 *            dynamic
 * @param referenceFrame
 *            reference frame
 * @param mapProjection
 *            map projection
 * @param coordinateSystem
 *            coordinate system
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andBaseName: (NSString *) baseName andBaseType: (enum CRSType) baseType andDynamic: (CRSDynamic *) dynamic andReferenceFrame: (CRSGeoReferenceFrame *) referenceFrame andMapProjection: (CRSMapProjection *) mapProjection andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem;

/**
 * Get the base name
 *
 * @return base name
 */
-(NSString *) baseName;

/**
 * Set the base name
 *
 * @param baseName
 *            base name
 */
-(void) setBaseName: (NSString *) baseName;

/**
 * Get the base type
 *
 * @return base type
 */
-(enum CRSType) baseType;

/**
 * Set the base type
 *
 * @param baseType
 *            base type
 */
-(void) setBaseType: (enum CRSType) baseType;

/**
 * Get the reference frame
 *
 * @return reference frame
 */
-(CRSGeoReferenceFrame *) referenceFrame;

/**
 * Determine if has a reference frame
 *
 * @return true if has reference frame
 */
-(BOOL) hasReferenceFrame;

/**
 * Set the reference frame
 *
 * @param referenceFrame
 *            reference frame
 */
-(void) setReferenceFrame: (CRSGeoReferenceFrame *) referenceFrame;

/**
 * Get the datum ensemble
 *
 * @return datum ensemble
 */
-(CRSGeoDatumEnsemble *) datumEnsemble;

/**
 * Determine if has a datum ensemble
 *
 * @return true if has datum ensemble
 */
-(BOOL) hasDatumEnsemble;

/**
 * Set the datum ensemble
 *
 * @param datumEnsemble
 *            datum ensemble
 */
-(void) setDatumEnsemble: (CRSGeoDatumEnsemble *) datumEnsemble;

/**
 * Get the dynamic coordinate reference system
 *
 * @return dynamic coordinate reference system
 */
-(CRSDynamic *) dynamic;

/**
 * Determine if has a dynamic
 *
 * @return true if has dynamic
 */
-(BOOL) hasDynamic;

/**
 * Set the dynamic coordinate reference system
 *
 * @param dynamic
 *            dynamic coordinate reference system
 */
-(void) setDynamic: (CRSDynamic *) dynamic;

/**
 * Get the geodetic or geographic common datum
 *
 * @return geo datum
 */
-(NSObject<CRSGeoDatum> *) geoDatum;

/**
 * Get the base identifiers
 *
 * @return base identifiers
 */
-(NSMutableArray<CRSIdentifier *> *) baseIdentifiers;

/**
 * Has base identifiers
 *
 * @return true if has base identifiers
 */
-(BOOL) hasBaseIdentifiers;

/**
 * Number of base identifiers
 *
 * @return base identifiers count
 */
-(int) numBaseIdentifiers;

/**
 * Get the base identifier at the index
 *
 * @param index
 *            base identifier index
 * @return base identifier
 */
-(CRSIdentifier *) baseIdentifierAtIndex: (int) index;

/**
 * Set the base identifiers
 *
 * @param baseIdentifiers
 *            base identifiers
 */
-(void) setBaseIdentifiers: (NSArray<CRSIdentifier *> *) baseIdentifiers;

/**
 * Add the base identifier
 *
 * @param baseIdentifier
 *            base identifier
 */
-(void) addBaseIdentifier: (CRSIdentifier *) baseIdentifier;

/**
 * Add the base identifiers
 *
 * @param baseIdentifiers
 *            base identifiers
 */
-(void) addBaseIdentifiers: (NSArray<CRSIdentifier *> *) baseIdentifiers;

/**
 * Get the unit (ellipsoidal angle)
 *
 * @return unit (ellipsoidal angle)
 */
-(CRSUnit *) unit;

/**
 * Has a unit (ellipsoidal angle)
 *
 * @return true if has unit (ellipsoidal angle)
 */
-(BOOL) hasUnit;

/**
 * Set the unit (angle)
 *
 * @param unit
 *            unit (ellipsoidal angle)
 */
-(void) setUnit: (CRSUnit *) unit;

@end
