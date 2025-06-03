//
//  PROJCRSParser.m
//  proj-ios
//
//  Created by Brian Osborn on 7/9/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Projections/PROJCRSParser.h>

@import proj;
@import CoordinateReferenceSystems;

@implementation PROJCRSParser

+(PJ *) parseText: (NSString *) wkt{
    return proj_create_from_wkt(PJ_DEFAULT_CTX, [wkt UTF8String], NULL, NULL, NULL);
}

+(PJ *) convertCRS: (CRSObject *) crs{
    return [self createProj:[CRSProjParser paramsTextFromCRS:crs]];
}

+(PJ *) convertGeo: (CRSGeoCoordinateReferenceSystem *) geo{
    return [self createProj:[CRSProjParser paramsTextFromGeo:geo]];
}

+(PJ *) convertProjected: (CRSProjectedCoordinateReferenceSystem *) projected{
    return [self createProj:[CRSProjParser paramsTextFromProjected:projected]];
}

+(PJ *) convertCompound: (CRSCompoundCoordinateReferenceSystem *) compound{
    return [self createProj:[CRSProjParser paramsTextFromCompound:compound]];
}

+(PJ *) createProj: (NSString *) params{
    PJ *crs = NULL;
    if(params != nil){
        crs = proj_create(PJ_DEFAULT_CTX, [params UTF8String]);
    }
    return crs;
}

+(BOOL) hasToWGS84: (CRSObject *) crs {
    BOOL has = [crs extraWithName:[CRSKeyword nameOfType:CRS_KEYWORD_TOWGS84]] != nil;
    if (!has) {
        if ([crs isKindOfClass:[CRSProjectedCoordinateReferenceSystem class]]) {
            CRSProjectedCoordinateReferenceSystem *projected = (CRSProjectedCoordinateReferenceSystem *) crs;
            if (projected.base != nil) {
                has = [projected.base extraWithName:[CRSKeyword nameOfType:CRS_KEYWORD_TOWGS84]] != nil;
            }
        }
    }
    return has;
}

@end
