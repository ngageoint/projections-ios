//
//  CRSDatumEnsemble.h
//  crs-ios
//
//  Created by Brian Osborn on 7/15/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSDatumEnsembleMember.h"

/**
 * Datum Ensemble
 */
@interface CRSDatumEnsemble : NSObject<CRSIdentifiable>

/**
 *  Name
 */
@property (nonatomic, strong) NSString *name;

/**
 * Members
 */
@property (nonatomic, strong) NSMutableArray<CRSDatumEnsembleMember *> *members;

/**
 * Accuracy (in meters)
 */
@property (nonatomic) double accuracy;

/**
 *  Accuracy (in meters) Text
 */
@property (nonatomic, strong) NSString *accuracyText;

/**
 * Identifiers
 */
@property (nonatomic, strong) NSMutableArray<CRSIdentifier *> *identifiers;

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
 * @param member
 *            member
 * @param accuracy
 *            accuracy
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andMember: (CRSDatumEnsembleMember *) member andAccuracyText: (NSString *) accuracy;

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
-(instancetype) initWithName: (NSString *) name andMembers: (NSArray<CRSDatumEnsembleMember *> *) members andAccuracyText: (NSString *) accuracy;

/**
 * Number of members
 *
 * @return members count
 */
-(int) numMembers;

/**
 * Get the member at the index
 *
 * @param index
 *            member index
 * @return member
 */
-(CRSDatumEnsembleMember *) memberAtIndex: (int) index;

/**
 * Add the member
 *
 * @param member
 *            member
 */
-(void) addMember: (CRSDatumEnsembleMember *) member;

/**
 * Add the members
 *
 * @param members
 *            members
 */
-(void) addMembers: (NSArray<CRSDatumEnsembleMember *> *) members;

@end
