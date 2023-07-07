//
//  CRSReferenceFrame.h
//  crs-ios
//
//  Created by Brian Osborn on 7/15/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSIdentifiable.h"
#import "CRSTypes.h"

/**
 * Reference Frame (datum)
 *
 * @author osbornb
 */
@interface CRSReferenceFrame : NSObject<CRSIdentifiable>

/**
 *  Name
 */
@property (nonatomic, strong) NSString *name;

/**
 *  Type
 */
@property (nonatomic) enum CRSType type;

/**
 *  Datum anchor description
 */
@property (nonatomic, strong) NSString *anchor;

/**
 * Identifiers
 */
@property (nonatomic, strong) NSMutableArray<CRSIdentifier *> *identifiers;

/**
 *  Initialize
 *
 * @param type
 *            type
 *
 *  @return new instance
 */
-(instancetype) initWithType: (enum CRSType) type;

/**
 *  Initialize
 *
 * @param name
 *            name
 * @param type
 *            type
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andType: (enum CRSType) type;

/**
 * Has a datum anchor description
 *
 * @return true if has datum anchor description
 */
-(BOOL) hasAnchor;

@end
