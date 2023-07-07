//
//  CRSUnit.h
//  crs-ios
//
//  Created by Brian Osborn on 7/13/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSIdentifiable.h"
#import "CRSUnitTypes.h"

/**
 * Unit
 */
@interface CRSUnit : NSObject<CRSIdentifiable>

/**
 *  Unit Type
 */
@property (nonatomic) enum CRSUnitType type;

/**
 *  Name
 */
@property (nonatomic, strong) NSString *name;

/**
 *  Conversion Factor
 */
@property (nonatomic, strong) NSDecimalNumber *conversionFactor;

/**
 *  Conversion Factor Text
 */
@property (nonatomic, strong) NSString *conversionFactorText;

/**
 * Identifiers
 */
@property (nonatomic, strong) NSMutableArray<CRSIdentifier *> *identifiers;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSUnit *) create;

/**
 *  Create
 *
 * @param type
 *            unit type
 * @param name
 *            name
 *
 *  @return new instance
 */
+(CRSUnit *) createWithType: (enum CRSUnitType) type andName: (NSString *) name;

/**
 *  Create
 *
 * @param type
 *            unit type
 * @param name
 *            name
 * @param conversionFactor
 *            conversion factor
 *
 *  @return new instance
 */
+(CRSUnit *) createWithType: (enum CRSUnitType) type andName: (NSString *) name andConversionFactor: (double) conversionFactor;

/**
 *  Create
 *
 * @param type
 *            unit type
 * @param name
 *            name
 * @param conversionFactor
 *            conversion factor
 *
 *  @return new instance
 */
+(CRSUnit *) createWithType: (enum CRSUnitType) type andName: (NSString *) name andConversionFactorText: (NSString *) conversionFactor;

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
 *            unit type
 * @param name
 *            name
 *
 *  @return new instance
 */
-(instancetype) initWithType: (enum CRSUnitType) type andName: (NSString *) name;

/**
 *  Initialize
 *
 * @param type
 *            unit type
 * @param name
 *            name
 * @param conversionFactor
 *            conversion factor
 *
 *  @return new instance
 */
-(instancetype) initWithType: (enum CRSUnitType) type andName: (NSString *) name andConversionFactor: (double) conversionFactor;

/**
 *  Initialize
 *
 * @param type
 *            unit type
 * @param name
 *            name
 * @param conversionFactor
 *            conversion factor
 *
 *  @return new instance
 */
-(instancetype) initWithType: (enum CRSUnitType) type andName: (NSString *) name andConversionFactorText: (NSString *) conversionFactor;

/**
 * Has a conversion factor
 *
 * @return true if has conversion factor
 */
-(BOOL) hasConversionFactor;

/**
 * Determine if the unit names are equal, ignoring case
 *
 * @return true if equal names
 */
-(BOOL) isEqualNameToUnit: (CRSUnit *) unit;

@end
