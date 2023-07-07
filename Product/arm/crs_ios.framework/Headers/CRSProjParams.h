//
//  CRSProjParams.h
//  crs-ios
//
//  Created by Brian Osborn on 9/2/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * PROJ params
 */
@interface CRSProjParams : NSObject

@property (nonatomic, strong) NSString *proj;
@property (nonatomic, strong) NSString *zone;
@property (nonatomic) BOOL south;
@property (nonatomic, strong) NSString *lat_1;
@property (nonatomic, strong) NSString *lat_2;
@property (nonatomic, strong) NSString *lat_0;
@property (nonatomic, strong) NSString *lat_ts;
@property (nonatomic, strong) NSString *lon_0;
@property (nonatomic, strong) NSString *lonc;
@property (nonatomic, strong) NSString *alpha;
@property (nonatomic, strong) NSString *k_0;
@property (nonatomic, strong) NSString *x_0;
@property (nonatomic, strong) NSString *y_0;
@property (nonatomic, strong) NSString *axis;
@property (nonatomic, strong) NSString *datum;
@property (nonatomic) BOOL no_uoff;
@property (nonatomic, strong) NSString *gamma;
@property (nonatomic, strong) NSString *a;
@property (nonatomic, strong) NSString *b;
@property (nonatomic, strong) NSString *ellps;
@property (nonatomic, strong) NSString *towgs84;
@property (nonatomic, strong) NSString *xTranslation;
@property (nonatomic, strong) NSString *yTranslation;
@property (nonatomic, strong) NSString *zTranslation;
@property (nonatomic, strong) NSString *xRotation;
@property (nonatomic, strong) NSString *yRotation;
@property (nonatomic, strong) NSString *zRotation;
@property (nonatomic, strong) NSString *scaleDifference;
@property (nonatomic, strong) NSString *pm;
@property (nonatomic, strong) NSString *units;
@property (nonatomic, strong) NSString *to_meter;
@property (nonatomic, strong) NSString *nadgrids;
@property (nonatomic) BOOL wktext;
@property (nonatomic) BOOL no_defs;

/**
 *  Create
 *
 *  @return new params
 */
+(CRSProjParams *) params;

/**
 *  Initialize
 *
 *  @return new params
 */
-(instancetype) init;

@end
