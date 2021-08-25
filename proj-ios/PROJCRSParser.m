//
//  PROJCRSParser.m
//  proj-ios
//
//  Created by Brian Osborn on 7/9/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "PROJCRSParser.h"
#import "CRSReader.h"
#import "PROJEllipsoid.h"
#import "CRSTriaxialEllipsoid.h"
#import "CRSUnits.h"
#import "CRSTextUtils.h"
#import "PROJPrimeMeridian.h"

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

    CRSOperationMethod *method = mapProjection.method;
    [self updateDatumTransformWithParams:params andOperationMethod:method];

    [self updateProjWithParams:params andCoordinateSystem:projected.coordinateSystem andMapProjection:projected.mapProjection];
    [self updatePrimeMeridianWithParams:params andGeoDatum:geoDatum];
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
    
    PROJEllipsoid *converted = [PROJEllipsoid fromName:name];
    
    if(converted != nil){
        [params setEllps:[converted shortName]];
    }else{
        
        [params setA:ellipsoid.semiMajorAxisText];
        
        switch(ellipsoid.type){
            case CRS_ELLIPSOID_OBLATE:
                [params setB:ellipsoid.inverseFlatteningText];
                break;
            case CRS_ELLIPSOID_TRIAXIAL:
            {
                CRSTriaxialEllipsoid *triaxial = (CRSTriaxialEllipsoid *) ellipsoid;
                [params setB:triaxial.semiMinorAxisText];
                break;
            }
            default:
                [NSException raise:@"Unsupported Type" format:@"Unsupported Ellipsoid Type: %@", [CRSEllipsoidTypes name:ellipsoid.type]];
        }
        
    }

}

+(void) updateDatumTransformWithParams: (PROJParams *) params andOperationMethod: (CRSOperationMethod *) method{
    
    for(CRSOperationParameter *parameter in method.parameters){
        
        if([parameter hasParameter]){
        
            switch(parameter.parameter.type){
                    
                case CRS_PARAMETER_X_AXIS_TRANSLATION:
                    [params setParam1:[self valueOfParameter:parameter inUnit:[CRSUnits metre]]];
                    break;
                    
                case CRS_PARAMETER_Y_AXIS_TRANSLATION:
                    [params setParam2:[self valueOfParameter:parameter inUnit:[CRSUnits metre]]];
                    break;
                    
                case CRS_PARAMETER_Z_AXIS_TRANSLATION:
                    [params setParam3:[self valueOfParameter:parameter inUnit:[CRSUnits metre]]];
                    break;
                    
                case CRS_PARAMETER_X_AXIS_ROTATION:
                    [params setParam4:[self valueOfParameter:parameter inUnit:[CRSUnits arcSecond]]];
                    break;
                    
                case CRS_PARAMETER_Y_AXIS_ROTATION:
                    [params setParam5:[self valueOfParameter:parameter inUnit:[CRSUnits arcSecond]]];
                    break;
                    
                case CRS_PARAMETER_Z_AXIS_ROTATION:
                    [params setParam6:[self valueOfParameter:parameter inUnit:[CRSUnits arcSecond]]];
                    break;
                    
                case CRS_PARAMETER_SCALE_DIFFERENCE:
                    [params setParam7:[self valueOfParameter:parameter inUnit:[CRSUnits partsPerMillion]]];
                    break;
                    
                default:
                    break;
                    
                    
            }
        }
    }
    
}

+(void) updatePrimeMeridianWithParams: (PROJParams *) params andGeoDatum: (NSObject<CRSGeoDatum> *) geoDatum{
    
    if([geoDatum hasPrimeMeridian]){
        CRSPrimeMeridian *primeMeridian = [geoDatum primeMeridian];
        PROJPrimeMeridian *converted = [PROJPrimeMeridian fromName:primeMeridian.name];
        if(converted != nil){
            [params setPm:[converted name]];
        }else{
            [params setPm:[self convertValue:primeMeridian.longitude andTextValue:primeMeridian.longitudeText
                                    fromUnit:primeMeridian.longitudeUnit toUnit:[CRSUnits degree]]];
        }
    }
    
}

+(void) updateProjWithParams: (PROJParams *) params andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem{
    
    CRSUnit *unit = [coordinateSystem axisUnit];

    if(unit != nil && (unit.type == CRS_UNIT_ANGLE || (unit.type == CRS_UNIT && [[unit.name lowercaseString] hasPrefix:@"deg"]))){
        [params setProj:@"longlat"];
    }else{
        [params setProj:@"merc"];
    }
}

+(void) updateProjWithParams: (PROJParams *) params andCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem andMapProjection: (CRSMapProjection *) mapProjection{

    CRSOperationMethod *method = mapProjection.method;
    
    if([method hasMethod]){
        
        switch(method.method.type){
                
            case CRS_METHOD_ALBERS_EQUAL_AREA:
                [params setProj:@"aea"];
                break;
                
            case CRS_METHOD_AMERICAN_POLYCONIC:
                [params setProj:@"poly"];
                break;
                
            case CRS_METHOD_CASSINI_SOLDNER:
                [params setProj:@"cass"];
                break;
                
            case CRS_METHOD_EQUIDISTANT_CYLINDRICAL:
                [params setProj:@"eqc"];
                break;
                
            case CRS_METHOD_HOTINE_OBLIQUE_MERCATOR_A:
                [params setNo_uoff:YES];
            case CRS_METHOD_HOTINE_OBLIQUE_MERCATOR_B:
                if([[mapProjection.name lowercaseString] containsString:@"swiss oblique mercator"]){
                    [params setProj:@"somerc"];
                }else{
                    [params setProj:@"omerc"];
                }
                break;
                
            case CRS_METHOD_KROVAK:
                [params setProj:@"krovak"];
                break;
                
            case CRS_METHOD_LAMBERT_AZIMUTHAL_EQUAL_AREA:
                [params setProj:@"laea"];
                break;
                
            case CRS_METHOD_LAMBERT_CONIC_CONFORMAL_1SP:
            case CRS_METHOD_LAMBERT_CONIC_CONFORMAL_2SP:
                [params setProj:@"lcc"];
                break;
                
            case CRS_METHOD_LAMBERT_CYLINDRICAL_EQUAL_AREA:
                [params setProj:@"cea"];
                break;
                
            case CRS_METHOD_MERCATOR_A:
            case CRS_METHOD_MERCATOR_B:
                [params setProj:@"merc"];
                break;
                
            case CRS_METHOD_NEW_ZEALAND_MAP_GRID:
                [params setProj:@"nzmg"];
                break;
                
            case CRS_METHOD_OBLIQUE_STEREOGRAPHIC:
                [params setProj:@"sterea"];
                break;
                
            case CRS_METHOD_POLAR_STEREOGRAPHIC_A:
            case CRS_METHOD_POLAR_STEREOGRAPHIC_B:
            case CRS_METHOD_POLAR_STEREOGRAPHIC_C:
                [params setProj:@"stere"];
                break;
                
            case CRS_METHOD_POPULAR_VISUALISATION_PSEUDO_MERCATOR:
                [params setProj:@"merc"];
                break;
                
            case CRS_METHOD_TRANSVERSE_MERCATOR:
            case CRS_METHOD_TRANSVERSE_MERCATOR_SOUTH_ORIENTATED:
                if([[mapProjection.name lowercaseString] containsString:@"utm zone"]){
                    [params setProj:@"utm"];
                }else{
                    [params setProj:@"tmerc"];
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
        [params setAxis:axisOrder];
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

+(NSString *) valueOfParameter: (CRSOperationParameter *) parameter inUnit: (CRSUnit *) unit{
    return [self convertValue:parameter.value andTextValue:parameter.valueText fromUnit:parameter.unit toUnit:unit];
}

+(NSString *) convertValue: (double) value andTextValue: (NSString *) textValue fromUnit: (CRSUnit *) fromUnit toUnit: (CRSUnit *) toUnit{
    
    if(fromUnit == nil){
        fromUnit = [CRSUnits defaultUnit:toUnit.type];
    }
    
    if([CRSUnits canConvertBetweenUnit:fromUnit andUnit:toUnit]){
        value = [CRSUnits convertValue:value fromUnit:fromUnit toUnit:toUnit];
        textValue = [CRSTextUtils textFromDouble:value];
    }
    
    return textValue;
}

@end
