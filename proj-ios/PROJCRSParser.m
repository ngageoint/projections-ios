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
    PROJParams *params = [self paramsFromProjected:projected];
    
    // TODO
    NSMutableString *temp = [NSMutableString stringWithString:[params description]];
    [temp appendString:@" +lat_0=27.51882880555555 +lonc=52.60353916666667 +alpha=0.5716611944444444 +k=0.999895934 +x_0=658377.437 +y_0=3044969.194 +gamma=0.5716611944444444 +ellps=intl +towgs84=-133.63,-157.5,-158.62,0,0,0,0 +units=m +no_defs"];
    
    projPJ crs = pj_init_plus([temp UTF8String]);
    return crs;
}

+(projPJ) convertCompound: (CRSCompoundCoordinateReferenceSystem *) compound{
    return nil; // TODO
}

+(PROJParams *) paramsFromProjected: (CRSProjectedCoordinateReferenceSystem *) projected{
    
    PROJParams *params = [PROJParams params];
    
    CRSMapProjection *mapProjection = projected.mapProjection;

    NSObject<CRSGeoDatum> *geoDatum = [projected geoDatum];

    [self updateEllipsoidWithParams:params andEllipsoid:[geoDatum ellipsoid]];
    //DatumParameters datumParameters = new DatumParameters();

    //OperationMethod method = mapProjection.getMethod();
    //if (projected.hasIdentifiers()
    //        && projected.getIdentifier(0).getNameAndUniqueIdentifier()
    //                .equalsIgnoreCase(ProjectionConstants.AUTHORITY_EPSG
    //                        + ":"
    //                        + ProjectionConstants.EPSG_WEB_MERCATOR)) {
    //    datumParameters.setA(ellipsoid.getA());
    //    datumParameters.setES(0);
    //} else {
    //    datumParameters.setEllipsoid(ellipsoid);
    //}

    //datumParameters.setDatumTransform(convertDatumTransform(method));

    //Datum datum = datumParameters.getDatum();

    [self updateProjWithParams:params andCoordinateSystem:projected.coordinateSystem andMapProjection:projected.mapProjection];
    //updateProjection(projection, datum.getEllipsoid(), geoDatum);
    //updateProjection(projection, method);
    
    
    // +lat_0=
    // +lon_0=
    // +lonc=
    // +alpha=
    // +k=
    // +x_0=
    // +y_0=
    // +axis=wsu
    // +datum=
    // +no_uoff
    // +gamma=
    // +zone=
    // +a=
    // +b=
    // +south=
    // +ellps=
    // +towgs84=
    // +units=
    // +no_defs
    
    return params;
}

+(void) updateEllipsoidWithParams: (PROJParams *) params andEllipsoid: (CRSEllipsoid *) ellipsoid{

    NSString *name = ellipsoid.name;

    /*
    Ellipsoid converted = getEllipsoid(name);

    if (converted == null) {

        String shortName = name;
        if (ellipsoid.hasIdentifiers()) {
            shortName = ellipsoid.getIdentifier(0)
                    .getNameAndUniqueIdentifier();
        }
        double equatorRadius = ellipsoid.getSemiMajorAxis();
        double poleRadius = 0;
        double reciprocalFlattening = 0;

        switch (ellipsoid.getType()) {
        case OBLATE:
            reciprocalFlattening = ellipsoid.getInverseFlattening();
            if (reciprocalFlattening == 0) {
                reciprocalFlattening = Double.POSITIVE_INFINITY;
            }
            break;
        case TRIAXIAL:
            TriaxialEllipsoid triaxial = (TriaxialEllipsoid) ellipsoid;
            poleRadius = triaxial.getSemiMinorAxis();
            break;
        default:
            throw new CRSException(
                    "Unsupported Ellipsoid Type: " + ellipsoid.getType());
        }

        converted = new Ellipsoid(shortName, equatorRadius, poleRadius,
                reciprocalFlattening, name);
    }

     */
}

+(void) updateProjWithParams: (PROJParams *) params andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem{
    
    CRSUnit *unit = [coordinateSystem axisUnit];

    if(unit != nil && (unit.type == CRS_UNIT_ANGLE || (unit.type == CRS_UNIT && [[unit.name lowercaseString] hasPrefix:@"deg"]))){
        params.proj = @"longlat";
    }else{
        params.proj = @"merc";
    }
}

+(void) updateProjWithParams: (PROJParams *) params andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem andMapProjection: (CRSMapProjection *) mapProjection{

    CRSOperationMethod *method = mapProjection.method;
    
    if([method hasMethod]){
        
        switch(method.method.type){
                
            case CRS_METHOD_ALBERS_EQUAL_AREA:
                params.proj = @"aea";
                break;
                
            case CRS_METHOD_AMERICAN_POLYCONIC:
                params.proj = @"poly";
                break;
                
            case CRS_METHOD_CASSINI_SOLDNER:
                params.proj = @"cass";
                break;
                
            case CRS_METHOD_EQUIDISTANT_CYLINDRICAL:
                params.proj = @"eqc";
                break;
                
            case CRS_METHOD_HOTINE_OBLIQUE_MERCATOR_A:
                params.no_uoff = YES;
            case CRS_METHOD_HOTINE_OBLIQUE_MERCATOR_B:
                if([[mapProjection.name lowercaseString] containsString:@"swiss oblique mercator"]){
                    params.proj = @"somerc";
                }else{
                    params.proj = @"omerc";
                }
                break;
                
            case CRS_METHOD_KROVAK:
                params.proj = @"krovak";
                break;
                
            case CRS_METHOD_LAMBERT_AZIMUTHAL_EQUAL_AREA:
                params.proj = @"laea";
                break;
                
            case CRS_METHOD_LAMBERT_CONIC_CONFORMAL_1SP:
            case CRS_METHOD_LAMBERT_CONIC_CONFORMAL_2SP:
                params.proj = @"lcc";
                break;
                
            case CRS_METHOD_LAMBERT_CYLINDRICAL_EQUAL_AREA:
                params.proj = @"cea";
                break;
                
            case CRS_METHOD_MERCATOR_A:
            case CRS_METHOD_MERCATOR_B:
                params.proj = @"merc";
                break;
                
            case CRS_METHOD_NEW_ZEALAND_MAP_GRID:
                params.proj = @"nzmg";
                break;
                
            case CRS_METHOD_OBLIQUE_STEREOGRAPHIC:
                params.proj = @"sterea";
                break;
                
            case CRS_METHOD_POLAR_STEREOGRAPHIC_A:
            case CRS_METHOD_POLAR_STEREOGRAPHIC_B:
            case CRS_METHOD_POLAR_STEREOGRAPHIC_C:
                params.proj = @"stere";
                break;
                
            case CRS_METHOD_POPULAR_VISUALISATION_PSEUDO_MERCATOR:
                params.proj = @"merc";
                break;
                
            case CRS_METHOD_TRANSVERSE_MERCATOR:
            case CRS_METHOD_TRANSVERSE_MERCATOR_SOUTH_ORIENTATED:
                if([[mapProjection.name lowercaseString] containsString:@"utm zone"]){
                    params.proj = @"utm";
                }else{
                    params.proj = @"tmerc";
                }
                break;
                
            default:
                break;
                
        }
        
        if (params.proj != nil) {
            [self updateAxisWithParams:params andCoordinateSystem:coordinateSystem];
        }
        
    }

    if(params.proj == nil){
        [self updateProjWithParams:params andCoordinateSystem:coordinateSystem];
    }
    
}

+(void) updateAxisWithParams: (PROJParams *) params andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem{

    NSString *axisOrder = [self convertAxes:coordinateSystem.axes];
    // Only known proj4 axis specification is wsu
    if([axisOrder isEqualToString:@"wsu"]) {
        params.axis = axisOrder;
    }

}

+(NSString *) convertAxes: (NSArray<CRSAxis *> *) axes{

    NSString *axisValue = nil;

    NSUInteger axesCount = axes.count;
    if(axesCount == 2 || axesCount == 3){

        NSMutableString *axisString = [NSMutableString string];

        for(CRSAxis *axis in axes){

            switch(axis.direction){

                case CRS_AXIS_EAST:
                    [axisString appendString:@"e"];
                    break;

                case CRS_AXIS_WEST:
                    [axisString appendString:@"w"];
                    break;

                case CRS_AXIS_NORTH:
                    [axisString appendString:@"n"];
                    break;

                case CRS_AXIS_SOUTH:
                    [axisString appendString:@"s"];
                    break;

                case CRS_AXIS_UP:
                    [axisString appendString:@"u"];
                    break;

                case CRS_AXIS_DOWN:
                    [axisString appendString:@"d"];
                    break;

                default:
                    axisString = nil;
                    break;

            }

            if(axisString == nil){
                break;
            }
        }

        if(axisString != nil){

            if(axesCount == 2){
                [axisString appendString:@"u"];
            }

        }

    }

    return axisValue;
}

@end
