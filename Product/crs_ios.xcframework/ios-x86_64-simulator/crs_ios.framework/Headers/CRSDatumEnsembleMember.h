//
//  CRSDatumEnsembleMember.h
//  crs-ios
//
//  Created by Brian Osborn on 7/15/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSIdentifiable.h"

/**
 * Datum Ensemble Member
 */
@interface CRSDatumEnsembleMember : NSObject<CRSIdentifiable>

/**
 *  Name
 */
@property (nonatomic, strong) NSString *name;

/**
 * Identifiers
 */
@property (nonatomic, strong) NSMutableArray<CRSIdentifier *> *identifiers;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSDatumEnsembleMember *) create;

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

@end
