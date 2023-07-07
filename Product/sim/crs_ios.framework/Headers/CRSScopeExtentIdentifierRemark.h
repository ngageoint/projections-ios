//
//  CRSScopeExtentIdentifierRemark.h
//  crs-ios
//
//  Created by Brian Osborn on 7/13/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#ifndef CRSScopeExtentIdentifierRemark_h
#define CRSScopeExtentIdentifierRemark_h

#import "CRSUsage.h"

/**
 *  Interface Scope, Extent, Identifier, and Remark values
 */
@protocol CRSScopeExtentIdentifierRemark <CRSIdentifiable>

/**
 * Get the name
 *
 * @return name
 */
-(NSString *) name;

/**
 * Set the name
 *
 * @param name
 *            name
 */
-(void) setName: (NSString *) name;

/**
 * Get the usages
 *
 * @return usages
 */
-(NSMutableArray<CRSUsage *> *) usages;

/**
 * Has usages
 *
 * @return true if has usages
 */
-(BOOL) hasUsages;

/**
 * Number of usages
 *
 * @return usages count
 */
-(int) numUsages;

/**
 * Get the usage at the index
 *
 * @param index
 *            usage index
 * @return usage
 */
-(CRSUsage *) usageAtIndex: (int) index;

/**
 * Set the usages
 *
 * @param usages
 *            usages
 */
-(void) setUsages: (NSArray<CRSUsage *> *) usages;

/**
 * Add the usage
 *
 * @param usage
 *            usage
 */
-(void) addUsage: (CRSUsage *) usage;

/**
 * Add the usages
 *
 * @param usages
 *            usages
 */
-(void) addUsages: (NSArray<CRSUsage *> *) usages;

/**
 * Get the remark
 *
 * @return remark
 */
-(NSString *) remark;

/**
 * Has remark
 *
 * @return true if has remark
 */
-(BOOL) hasRemark;

/**
 * Set the remark
 *
 * @param remark
 *            remark
 */
-(void) setRemark: (NSString *) remark;

@end

#endif /* CRSScopeExtentIdentifierRemark_h */
