//
//  PROJCRSParser.m
//  proj-ios
//
//  Created by Brian Osborn on 7/9/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "PROJCRSParser.h"
#import "CRSReader.h"

@implementation PROJCRSParser

+(projPJ) parseText: (NSString *) wkt{
    
    CRSObject *crsObject = [CRSReader read:wkt];

    projPJ crs = nil;
    if(crsObject != nil){
        crs = [self convertCRS:crsObject];
    }

    return crs;
}

+(projPJ) convertCRS: (CRSObject *) crsObject{
    
    projPJ crs = nil;
    
    switch(crsObject.type){
            
        case CRS_TYPE_GEODETIC:
        case CRS_TYPE_GEOGRAPHIC:
            crs = [self convertGeo:(CRSGeoCoordinateReferenceSystem *) crsObject];
            break;
            
        case CRS_TYPE_PROJECTED:
            crs = [self convertProjected:(CRSProjectedCoordinateReferenceSystem *) crsObject];
            break;
            
        case CRS_TYPE_COMPOUND:
            crs = [self convertCompound:(CRSCompoundCoordinateReferenceSystem *) crsObject];
            break;
            
        default:
            break;
            
    }
    
    return crs;
}

+(projPJ) convertGeo: (CRSGeoCoordinateReferenceSystem *) geo{
    return nil; // TODO
}

+(projPJ) convertProjected: (CRSProjectedCoordinateReferenceSystem *) projected{
    return nil; // TODO
}

+(projPJ) convertCompound: (CRSCompoundCoordinateReferenceSystem *) compound{
    return nil; // TODO
}

@end
