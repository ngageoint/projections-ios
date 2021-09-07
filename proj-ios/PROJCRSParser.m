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

+(projPJ) parseText: (NSString *) wkt{
    return [self createProj:[CRSProjParser paramsTextFromText:wkt]];
}

+(projPJ) convertCRS: (CRSObject *) crs{
    return [self createProj:[CRSProjParser paramsTextFromCRS:crs]];
}

+(projPJ) convertGeo: (CRSGeoCoordinateReferenceSystem *) geo{
    return [self createProj:[CRSProjParser paramsTextFromGeo:geo]];
}

+(projPJ) convertProjected: (CRSProjectedCoordinateReferenceSystem *) projected{
    return [self createProj:[CRSProjParser paramsTextFromProjected:projected]];
}

+(projPJ) convertCompound: (CRSCompoundCoordinateReferenceSystem *) compound{
    return [self createProj:[CRSProjParser paramsTextFromCompound:compound]];
}

+(projPJ) createProj: (NSString *) params{
    projPJ crs = NULL;
    if(params != nil){
        crs = pj_init_plus([params UTF8String]);
    }
    return crs;
}

@end
