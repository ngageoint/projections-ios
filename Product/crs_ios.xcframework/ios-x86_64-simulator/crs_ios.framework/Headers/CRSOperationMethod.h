//
//  CRSOperationMethod.h
//  crs-ios
//
//  Created by Brian Osborn on 7/19/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSOperationMethods.h"
#import "CRSOperationParameter.h"

/**
 * Operation Method
 */
@interface CRSOperationMethod : NSObject<CRSIdentifiable>

/**
 *  Name
 */
@property (nonatomic, strong) NSString *name;

/**
 * Operation parameters
 */
@property (nonatomic, strong) NSMutableArray<CRSOperationParameter *> *parameters;

/**
 * Identifiers
 */
@property (nonatomic, strong) NSMutableArray<CRSIdentifier *> *identifiers;

/**
 * Commonly encountered operation methods
 */
@property (nonatomic, strong) CRSOperationMethods *method;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSOperationMethod *) create;

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
 *  Initialize
 *
 * @param method
 *            operation method
 *
 *  @return new instance
 */
-(instancetype) initWithMethod: (CRSOperationMethods *) method;

/**
 * Has parameters
 *
 * @return true if has parameters
 */
-(BOOL) hasParameters;

/**
 * Number of parameters
 *
 * @return parameters count
 */
-(int) numParameters;

/**
 * Get the parameter at the index
 *
 * @param index
 *            parameter index
 * @return parameter
 */
-(CRSOperationParameter *) parameterAtIndex: (int) index;

/**
 * Add the parameter
 *
 * @param parameter
 *            parameter
 */
-(void) addParameter: (CRSOperationParameter *) parameter;

/**
 * Add the parameters
 *
 * @param parameters
 *            parameters
 */
-(void) addParameters: (NSArray<CRSOperationParameter *> *) parameters;

/**
 * Is a commonly known method type
 *
 * @return true if has common method type
 */
-(BOOL) hasMethod;

/**
 * Update the commonly known method type using the name
 */
-(void) updateMethod;

@end
