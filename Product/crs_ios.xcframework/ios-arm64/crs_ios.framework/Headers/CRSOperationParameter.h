//
//  CRSOperationParameter.h
//  crs-ios
//
//  Created by Brian Osborn on 7/16/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSUnit.h"
#import "CRSOperationParameters.h"

/**
 * Operation Parameter
 */
@interface CRSOperationParameter : NSObject<CRSIdentifiable>

/**
 *  Name
 */
@property (nonatomic, strong) NSString *name;

/**
 *  Value
 */
@property (nonatomic) double value;

/**
 *  Value Text
 */
@property (nonatomic, strong) NSString *valueText;

/**
 * Unit
 */
@property (nonatomic, strong) CRSUnit *unit;

/**
 *  File Name
 */
@property (nonatomic, strong) NSString *fileName;

/**
 * Identifiers
 */
@property (nonatomic, strong) NSMutableArray<CRSIdentifier *> *identifiers;

/**
 * Commonly encountered operation parameters
 */
@property (nonatomic, strong) CRSOperationParameters *parameter;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSOperationParameter *) create;

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
 * @param value
 *            value
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andValue: (double) value;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param value
 *            value
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andValueText: (NSString *) value;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param value
 *            value
 * @param unit
 *            unit
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andValue: (double) value andUnit: (CRSUnit *) unit;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param value
 *            value
 * @param unit
 *            unit
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andValueText: (NSString *) value andUnit: (CRSUnit *) unit;

/**
 *  Initialize
 *
 * @param parameter
 *            operation parameter
 * @param value
 *            value
 *
 *  @return new instance
 */
-(instancetype) initWithParameter: (CRSOperationParameters *) parameter andValue: (double) value;

/**
 *  Initialize
 *
 * @param parameter
 *            operation parameter
 * @param value
 *            value
 *
 *  @return new instance
 */
-(instancetype) initWithParameter: (CRSOperationParameters *) parameter andValueText: (NSString *) value;

/**
 *  Initialize
 *
 * @param parameter
 *            operation parameter
 * @param value
 *            value
 * @param unit
 *            unit
 *
 *  @return new instance
 */
-(instancetype) initWithParameter: (CRSOperationParameters *) parameter andValue: (double) value andUnit: (CRSUnit *) unit;

/**
 *  Initialize
 *
 * @param parameter
 *            operation parameter
 * @param value
 *            value
 * @param unit
 *            unit
 *
 *  @return new instance
 */
-(instancetype) initWithParameter: (CRSOperationParameters *) parameter andValueText: (NSString *) value andUnit: (CRSUnit *) unit;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param fileName
 *            file name
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andFileName: (NSString *) fileName;

/**
 * Has a unit
 *
 * @return true if has unit
 */
-(BOOL) hasUnit;

/**
 * Is a parameter file
 *
 * @return true if file
 */
-(BOOL) isFile;

/**
 * Is a commonly known parameter type
 *
 * @return true if has common parameter type
 */
-(BOOL) hasParameter;

/**
 * Update the commonly known parameter type using the name
 */
-(void) updateParameter;

@end
