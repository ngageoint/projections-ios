//
//  CRSObject.h
//  crs-ios
//
//  Created by Brian Osborn on 7/12/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSScopeExtentIdentifierRemark.h"
#import "CRSTypes.h"

/**
 * Well-known text representation of coordinate reference systems object
 */
@interface CRSObject : NSObject<CRSScopeExtentIdentifierRemark>

/**
 *  Type
 */
@property (nonatomic) enum CRSType type;

/**
 * Temporary extras that are not included as part of the CRS definition. Not
 * included in equality and hashing.
 */
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSObject *> *extras;

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
 * Get the category type
 *
 * @return category type
 */
-(enum CRSCategoryType) categoryType;

/**
 * Determine if there are temporary extras that are not part of the CRS
 * definition
 *
 * @return true if extras
 */
-(BOOL) hasExtras;

/**
 * Get the number of temporary extras that are not part of the CRS
 * definition
 *
 * @return number of extras
 */
-(int) numExtras;

/**
 * Get the temporary extra with the name
 *
 * @param name
 *            extra name
 * @return extra value or null
 */
-(NSObject *) extraWithName: (NSString *) name;

/**
 * Add the temporary extra which is not part of the CRS definition
 *
 * @param name
 *            extra name
 * @param extra
 *            extra value
 */
-(void) addExtra: (NSObject *) extra withName: (NSString *) name;

/**
 * Add the temporary extras which are not part of the CRS definition
 *
 * @param extras
 *            extra values
 */
-(void) addExtras: (NSMutableDictionary<NSString *, NSObject *> *) extras;

@end
