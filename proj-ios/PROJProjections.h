//
//  PROJProjections.h
//  proj-ios
//
//  Created by Brian Osborn on 7/16/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PROJAuthorityProjections.h"

/**
 *  Collection of projections by authority
 */
@interface PROJProjections : NSObject

/**
 *  Initialize
 *
 *  @return new projections
 */
-(instancetype) init;

/**
 * Get the authority projections
 *
 * @param authority
 *            coordinate authority
 * @return authority projections
 */
-(PROJAuthorityProjections *) projectionsForAuthority: (NSString *) authority;

/**
 * Get the projection for the authority and code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            coordinate code
 * @return projection
 */
-(PROJProjection *) projectionForAuthority: (NSString *) authority andCode: (NSString *) code;

/**
 * Check if the collection contains the projection
 *
 * @param projection
 *            projection
 * @return true if has the projection
 */
-(BOOL) hasProjection: (PROJProjection *) projection;

/**
 * Check if the collection contains a projection for the authority and code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            coordinate code
 * @return true if has a projection
 */
-(BOOL) hasProjectionWithAuthority: (NSString *) authority andCode: (NSString *) code;

/**
 * Add the projection
 *
 * @param projection
 *            projection
 */
-(void) addProjection: (PROJProjection *) projection;

/**
 * Clear all projections
 */
-(void) clear;

/**
 * Clear all projections for the authority
 *
 * @param authority
 *            coordinate authority
 */
-(void) clearAuthority: (NSString *) authority;

/**
 * Remove the projection for the authority and code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            coordinate code
 */
-(void) removeAuthority: (NSString *) authority andNumberCode: (NSNumber *) code;

/**
 * Remove the projection for the authority and code
 *
 * @param authority
 *            coordinate authority
 * @param code
 *            coordinate code
 */
-(void) removeAuthority: (NSString *) authority andCode: (NSString *) code;

/**
 * Remove the projection
 *
 * @param projection
 *            projection
 */
-(void) removeProjection: (PROJProjection *) projection;

/**
 * Get the count of authorities
 *
 * @return count
 */
-(int) authorityCount;

/**
 * Get the authorities
 *
 * @return authorities
 */
-(NSArray<NSString *> *) authorities;

/**
 * Get the count of projections
 *
 * @return count
 */
-(int) projectionCount;

/**
 * Is the collection empty?
 *
 * @return true if empty
 */
-(BOOL) isEmpty;

@end
