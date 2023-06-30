//
//  PROJCRSParser.m
//  proj-ios
//
//  Created by Brian Osborn on 7/9/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "PROJCRSParser.h"
#import "CRSProjParser.h"

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

@end
