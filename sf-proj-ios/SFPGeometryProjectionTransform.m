//
//  SFPGeometryProjectionTransform.m
//  sf-proj-ios
//
//  Created by Brian Osborn on 1/18/16.
//  Copyright © 2016 NGA. All rights reserved.
//

#import "SFPGeometryProjectionTransform.h"
#import "SFPLocationCoordinate3D.h"

@interface SFPGeometryProjectionTransform()

@property (nonatomic, strong) SFPProjectionTransform *transform;

@end

@implementation SFPGeometryProjectionTransform

-(instancetype) initWithProjectionTransform: (SFPProjectionTransform *) transform{
    self = [super init];
    if(self){
        self.transform = transform;
    }
    return self;
}

-(SFGeometry *) transformGeometry: (SFGeometry *) geometry{
    
    SFGeometry *to = nil;
    
    enum SFGeometryType geometryType = geometry.geometryType;
    switch(geometryType){
        case SF_POINT:
            to = [self transformPoint:(SFPoint *)geometry];
            break;
        case SF_LINESTRING:
            to = [self transformLineString:(SFLineString *)geometry];
            break;
        case SF_POLYGON:
            to = [self transformPolygon:(SFPolygon *)geometry];
            break;
        case SF_MULTIPOINT:
            to = [self transformMultiPoint:(SFMultiPoint *)geometry];
            break;
        case SF_MULTILINESTRING:
            to = [self transformMultiLineString:(SFMultiLineString *)geometry];
            break;
        case SF_MULTIPOLYGON:
            to = [self transformMultiPolygon:(SFMultiPolygon *)geometry];
            break;
        case SF_CIRCULARSTRING:
            to = [self transformCircularString:(SFCircularString *)geometry];
            break;
        case SF_COMPOUNDCURVE:
            to = [self transformCompoundCurve:(SFCompoundCurve *)geometry];
            break;
        case SF_CURVEPOLYGON:
            to = [self transformCurvePolygon:(SFCurvePolygon *)geometry];
            break;
        case SF_POLYHEDRALSURFACE:
            to = [self transformPolyhedralSurface:(SFPolyhedralSurface *)geometry];
            break;
        case SF_TIN:
            to = [self transformTIN:(SFTIN *)geometry];
            break;
        case SF_TRIANGLE:
            to = [self transformTriangle:(SFTriangle *)geometry];
            break;
        case SF_GEOMETRYCOLLECTION:
            to = [self transformGeometryCollection:(SFGeometryCollection *)geometry];
            break;
        default:
            [NSException raise:@"Unsupported Geometry" format:@"Unsupported Geometry Type: %u", geometryType];
    }
    
    return to;
}

-(SFPoint *) transformPoint: (SFPoint *) point{
    
    CLLocationCoordinate2D fromCoord2d = CLLocationCoordinate2DMake([point.y doubleValue], [point.x doubleValue]);
    SFPLocationCoordinate3D *fromCoord = [[SFPLocationCoordinate3D alloc] initWithCoordinate:fromCoord2d];
    if(point.hasZ){
        [fromCoord setZ:point.z];
    }
    
    SFPLocationCoordinate3D *toCoord = [self.transform transform3d:fromCoord];
    
    NSDecimalNumber *x = [[NSDecimalNumber alloc] initWithDouble:toCoord.coordinate.longitude];
    NSDecimalNumber *y = [[NSDecimalNumber alloc] initWithDouble:toCoord.coordinate.latitude];
    SFPoint *to = [[SFPoint alloc] initWithHasZ:point.hasZ andHasM:point.hasM andX:x andY:y];
    
    if(point.hasZ){
        [to setZ:toCoord.z];
    }
    if(point.hasM){
        [to setM:point.m];
    }
    
    return to;
}

-(SFLineString *) transformLineString: (SFLineString *) lineString{
    
    SFLineString *to = nil;
    
    switch (lineString.geometryType) {
        case SF_CIRCULARSTRING:
            to = [[SFCircularString alloc] initWithHasZ:lineString.hasZ andHasM:lineString.hasM];
            break;
        default:
            to = [[SFLineString alloc] initWithHasZ:lineString.hasZ andHasM:lineString.hasM];
    }
    
    for(SFPoint *point in lineString.points){
        SFPoint *toPoint = [self transformPoint:point];
        [to addPoint:toPoint];
    }
    
    return to;
}

-(SFPolygon *) transformPolygon: (SFPolygon *) polygon{
    
    SFPolygon *to = nil;
    
    switch (polygon.geometryType) {
        case SF_TRIANGLE:
            to = [[SFTriangle alloc] initWithHasZ:polygon.hasZ andHasM:polygon.hasM];
            break;
        default:
            to = [[SFPolygon alloc] initWithHasZ:polygon.hasZ andHasM:polygon.hasM];
    }
    
    for(SFLineString *ring in polygon.rings){
        SFLineString *toRing = [self transformLineString:ring];
        [to addRing:toRing];
    }
    
    return to;
}

-(SFMultiPoint *) transformMultiPoint: (SFMultiPoint *) multiPoint{

    SFMultiPoint *to = [[SFMultiPoint alloc] initWithHasZ:multiPoint.hasZ andHasM:multiPoint.hasM];
    
    for(SFPoint *point in [multiPoint points]){
        SFPoint *toPoint = [self transformPoint:point];
        [to addPoint:toPoint];
    }
    
    return to;
}

-(SFMultiLineString *) transformMultiLineString: (SFMultiLineString *) multiLineString{

    SFMultiLineString *to = [[SFMultiLineString alloc] initWithHasZ:multiLineString.hasZ andHasM:multiLineString.hasM];
    
    for(SFLineString *lineString in [multiLineString lineStrings]){
        SFLineString *toLineString = [self transformLineString:lineString];
        [to addLineString:toLineString];
    }
    
    return to;
}

-(SFMultiPolygon *) transformMultiPolygon: (SFMultiPolygon *) multiPolygon{
    
    SFMultiPolygon *to = [[SFMultiPolygon alloc] initWithHasZ:multiPolygon.hasZ andHasM:multiPolygon.hasM];
    
    for(SFPolygon *polygon in [multiPolygon polygons]){
        SFPolygon *toPolygon = [self transformPolygon:polygon];
        [to addPolygon:toPolygon];
    }
    
    return to;
}

-(SFCircularString *) transformCircularString: (SFCircularString *) circularString{
    return (SFCircularString *) [self transformLineString:circularString];
}

-(SFCompoundCurve *) transformCompoundCurve: (SFCompoundCurve *) compoundCurve{
    
    SFCompoundCurve *to = [[SFCompoundCurve alloc] initWithHasZ:compoundCurve.hasZ andHasM:compoundCurve.hasM];
    
    for(SFLineString *lineString in compoundCurve.lineStrings){
        SFLineString *toLineString = [self transformLineString:lineString];
        [to addLineString:toLineString];
    }
    
    return to;
}

-(SFCurvePolygon *) transformCurvePolygon: (SFCurvePolygon *) curvePolygon{
    
    SFCurvePolygon *to = [[SFCurvePolygon alloc] initWithHasZ:curvePolygon.hasZ andHasM:curvePolygon.hasM];
    
    for(SFCurve *ring in curvePolygon.rings){
        
        SFCurve *toRing = nil;
        
        switch (ring.geometryType) {
            case SF_COMPOUNDCURVE:
                toRing = [self transformCompoundCurve:(SFCompoundCurve *)ring];
                break;
            default:
                toRing = [self transformLineString:(SFLineString *)ring];
        }
        
        [to addRing:toRing];
    }
    
    return to;
}

-(SFPolyhedralSurface *) transformPolyhedralSurface: (SFPolyhedralSurface *) polyhedralSurface{
    
    SFPolyhedralSurface *to = nil;
    
    switch (polyhedralSurface.geometryType) {
        case SF_TIN:
            to = [[SFTIN alloc] initWithHasZ:polyhedralSurface.hasZ andHasM:polyhedralSurface.hasM];
            break;
        default:
            to = [[SFPolyhedralSurface alloc] initWithHasZ:polyhedralSurface.hasZ andHasM:polyhedralSurface.hasM];
    }
    
    for(SFPolygon *polygon in polyhedralSurface.polygons){
        SFPolygon *toPolygon = [self transformPolygon:polygon];
        [to addPolygon:toPolygon];
    }
    
    return to;
}

-(SFTIN *) transformTIN: (SFTIN *) tin{
    return (SFTIN *) [self transformPolyhedralSurface:tin];
}

-(SFTriangle *) transformTriangle: (SFTriangle *) triangle{
    return (SFTriangle *) [self transformPolygon:triangle];
}

-(SFGeometryCollection *) transformGeometryCollection: (SFGeometryCollection *) geometryCollection{
    
    SFGeometryCollection *to = [[SFGeometryCollection alloc] initWithHasZ:geometryCollection.hasZ andHasM:geometryCollection.hasM];
    
    for(SFGeometry *geometry in geometryCollection.geometries){
        SFGeometry *toGeometry = [self transformGeometry:geometry];
        [to addGeometry:toGeometry];
    }

    return to;
}

@end
