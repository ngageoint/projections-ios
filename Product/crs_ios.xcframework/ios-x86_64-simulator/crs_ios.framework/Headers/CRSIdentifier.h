//
//  CRSIdentifier.h
//  crs-ios
//
//  Created by Brian Osborn on 7/12/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Identifier (Authority)
 */
@interface CRSIdentifier : NSObject

/**
 *  Authority Name
 */
@property (nonatomic, strong) NSString *name;

/**
 *  Authority Unique Identifier
 */
@property (nonatomic, strong) NSString *uniqueIdentifier;

/**
 *  Version
 */
@property (nonatomic, strong) NSString *version;

/**
 *  Authority Citation
 */
@property (nonatomic, strong) NSString *citation;

/**
 *  URI
 */
@property (nonatomic, strong) NSString *uri;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSIdentifier *) create;

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
 *            authority name
 * @param uniqueIdentifier
 *            authority unique identifier
 *
 *  @return new instance
 */
-(instancetype) initWithName: (NSString *) name andUniqueIdentifier: (NSString *) uniqueIdentifier;

/**
 * Get the name and unique identifier separated by a colon
 *
 * @return name and unique identifier
 */
-(NSString *) nameAndUniqueIdentifier;

/**
 * Get the name and unique identifier separated by the delimiter
 *
 * @param delimiter
 *            delimiter
 * @return name and unique identifier
 */
-(NSString *) nameAndUniqueIdentifierWithDelimiter: (NSString *) delimiter;

/**
 * Has a version
 *
 * @return true if has version
 */
-(BOOL) hasVersion;

/**
 * Has an authority citation
 *
 * @return true if has authority citation
 */
-(BOOL) hasCitation;

/**
 * Has an id uri
 *
 * @return true if has id uri
 */
-(BOOL) hasUri;

@end
