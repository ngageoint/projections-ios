//
//  CRSIdentifiable.h
//  crs-ios
//
//  Created by Brian Osborn on 7/12/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#ifndef CRSIdentifiable_h
#define CRSIdentifiable_h

#import "CRSIdentifier.h"

/**
 *  Identifiable object interface
 */
@protocol CRSIdentifiable <NSObject>

/**
 * Get the identifiers
 *
 * @return identifiers
 */
-(NSMutableArray<CRSIdentifier *> *) identifiers;

/**
 * Has identifiers
 *
 * @return true if has identifiers
 */
-(BOOL) hasIdentifiers;

/**
 * Number of identifiers
 *
 * @return identifiers count
 */
-(int) numIdentifiers;

/**
 * Get the identifier at the index
 *
 * @param index
 *            identifier index
 * @return identifier
 */
-(CRSIdentifier *) identifierAtIndex: (int) index;

/**
 * Set the identifiers
 *
 * @param identifiers
 *            identifiers
 */
-(void) setIdentifiers: (NSArray<CRSIdentifier *> *) identifiers;

/**
 * Add the identifier
 *
 * @param identifier
 *            identifier
 */
-(void) addIdentifier: (CRSIdentifier *) identifier;

/**
 * Add the identifiers
 *
 * @param identifiers
 *            identifiers
 */
-(void) addIdentifiers: (NSArray<CRSIdentifier *> *) identifiers;

@end

#endif /* CRSIdentifiable_h */
