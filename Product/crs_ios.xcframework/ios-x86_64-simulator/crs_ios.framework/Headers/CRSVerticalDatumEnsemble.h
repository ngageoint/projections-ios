//
//  CRSVerticalDatumEnsemble.h
//  crs-ios
//
//  Created by Brian Osborn on 7/21/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSDatumEnsemble.h"

/**
 * Vertical Datum Ensemble
 */
@interface CRSVerticalDatumEnsemble : CRSDatumEnsemble

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSVerticalDatumEnsemble *) create;

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
 * @param member
 *            member
 * @param accuracy
 *            accuracy
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andMember: (CRSDatumEnsembleMember *) member andAccuracy: (double) accuracy;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param members
 *            members
 * @param accuracy
 *            accuracy
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andMembers: (NSArray<CRSDatumEnsembleMember *> *) members andAccuracy: (double) accuracy;

@end
