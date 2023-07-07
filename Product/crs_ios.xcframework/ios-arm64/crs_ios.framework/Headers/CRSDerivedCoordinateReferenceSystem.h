//
//  CRSDerivedCoordinateReferenceSystem.h
//  crs-ios
//
//  Created by Brian Osborn on 7/20/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSSimpleCoordinateReferenceSystem.h"
#import "CRSDerivingConversion.h"

/**
 * Derived Coordinate Reference System
 */
@interface CRSDerivedCoordinateReferenceSystem : CRSSimpleCoordinateReferenceSystem

/**
 * Base
 */
@property (nonatomic, strong) CRSCoordinateReferenceSystem *base;

/**
 * Deriving Conversion
 */
@property (nonatomic, strong) CRSDerivingConversion *conversion;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSDerivedCoordinateReferenceSystem *) create;

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
 * @param base
 *            base CRS
 * @param conversion
 *            deriving conversion
 * @param coordinateSystem
 *            coordinate system
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andBase: (CRSCoordinateReferenceSystem *) base andConversion: (CRSDerivingConversion *) conversion andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem;

/**
 * Get the base name
 *
 * @return base name
 */
-(NSString *) baseName;

/**
 * Get the base type
 *
 * @return base type
 */
-(enum CRSType) baseType;

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

@end
