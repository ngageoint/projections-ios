//
//  SFPGeometryProjectionTransform.m
//  sf-ios-proj
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
    
    SFGeometry * to = nil;
    
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
    SFPLocationCoordinate3D * fromCoord = [[SFPLocationCoordinate3D alloc] initWithCoordinate:fromCoord2d];
    if(point.hasZ){
        [fromCoord setZ:point.z];
    }
    
    SFPLocationCoordinate3D * toCoord = [self.transform transform3d:fromCoord];
    
    NSDecimalNumber * x = [[NSDecimalNumber alloc] initWithDouble:toCoord.coordinate.longitude];
    NSDecimalNumber * y = [[NSDecimalNumber alloc] initWithDouble:toCoord.coordinate.latitude];
    SFPoint * to = [[SFPoint alloc] initWithHasZ:point.hasZ andHasM:point.hasM andX:x andY:y];
    
    if(point.hasZ){
        [to setZ:toCoord.z];
    }
    if(point.hasM){
        [to setM:point.m];
    }
    
    return to;
}

-(SFLineString *) transformLineString: (SFLineString *) lineString{
    
    SFLineString * to = [[SFLineString alloc] initWithHasZ:lineString.hasZ andHasM:lineString.hasM];
    
    for(SFPoint * point in lineString.points){
        SFPoint * toPoint = [self transformPoint:point];
        [to addPoint:toPoint];
    }
    
    return to;
}

-(SFPolygon *) transformPolygon: (SFPolygon *) polygon{
    
    SFPolygon * to = [[SFPolygon alloc] initWithHasZ:polygon.hasZ andHasM:polygon.hasM];
    
    for(SFLineString * ring in polygon.rings){
        SFLineString * toRing = [self transformLineString:ring];
        [to addRing:toRing];
    }
    
    return to;
}

-(SFMultiPoint *) transformMultiPoint: (SFMultiPoint *) multiPoint{

    SFMultiPoint * to = [[SFMultiPoint alloc] initWithHasZ:multiPoint.hasZ andHasM:multiPoint.hasM];
    
    for(SFPoint * point in [multiPoint points]){
        SFPoint * toPoint = [self transformPoint:point];
        [to addPoint:toPoint];
    }
    
    return to;
}

-(SFMultiLineString *) transformMultiLineString: (SFMultiLineString *) multiLineString{

    SFMultiLineString * to = [[SFMultiLineString alloc] initWithHasZ:multiLineString.hasZ andHasM:multiLineString.hasM];
    
    for(SFLineString * lineString in [multiLineString lineStrings]){
        SFLineString * toLineString = [self transformLineString:lineString];
        [to addLineString:toLineString];
    }
    
    return to;
}

-(SFMultiPolygon *) transformMultiPolygon: (SFMultiPolygon *) multiPolygon{
    
    SFMultiPolygon * to = [[SFMultiPolygon alloc] initWithHasZ:multiPolygon.hasZ andHasM:multiPolygon.hasM];
    
    for(SFPolygon * polygon in [multiPolygon polygons]){
        SFPolygon * toPolygon = [self transformPolygon:polygon];
        [to addPolygon:toPolygon];
    }
    
    return to;
}

-(SFCircularString *) transformCircularString: (SFCircularString *) circularString{
    
    SFCircularString * to = [[SFCircularString alloc] initWithHasZ:circularString.hasZ andHasM:circularString.hasM];
    
    for(SFPoint * point in circularString.points){
        SFPoint * toPoint = [self transformPoint:point];
        [to addPoint:toPoint];
    }
    
    return to;
}

-(SFCompoundCurve *) transformCompoundCurve: (SFCompoundCurve *) compoundCurve{
    
    SFCompoundCurve * to = [[SFCompoundCurve alloc] initWithHasZ:compoundCurve.hasZ andHasM:compoundCurve.hasM];
    
    for(SFLineString * lineString in compoundCurve.lineStrings){
        SFLineString * toLineString = [self transformLineString:lineString];
        [to addLineString:toLineString];
    }
    
    return to;
}

-(SFPolyhedralSurface *) transformPolyhedralSurface: (SFPolyhedralSurface *) polyhedralSurface{
    
    SFPolyhedralSurface * to = [[SFPolyhedralSurface alloc] initWithHasZ:polyhedralSurface.hasZ andHasM:polyhedralSurface.hasM];
    
    for(SFPolygon * polygon in polyhedralSurface.polygons){
        SFPolygon * toPolygon = [self transformPolygon:polygon];
        [to addPolygon:toPolygon];
    }
    
    return to;
}

-(SFTIN *) transformTIN: (SFTIN *) tin{
    
    SFTIN * to = [[SFTIN alloc] initWithHasZ:tin.hasZ andHasM:tin.hasM];
    
    for(SFPolygon * polygon in tin.polygons){
        SFPolygon * toPolygon = [self transformPolygon:polygon];
        [to addPolygon:toPolygon];
    }
    
    return to;
}

-(SFTriangle *) transformTriangle: (SFTriangle *) triangle{
    
    SFTriangle * to = [[SFTriangle alloc] initWithHasZ:triangle.hasZ andHasM:triangle.hasM];
    
    for(SFLineString * ring in triangle.rings){
        SFLineString * toRing = [self transformLineString:ring];
        [to addRing:toRing];
    }
    
    return to;
}

-(SFGeometryCollection *) transformGeometryCollection: (SFGeometryCollection *) geometryCollection{
    
    SFGeometryCollection * to = [[SFGeometryCollection alloc] initWithHasZ:geometryCollection.hasZ andHasM:geometryCollection.hasM];
    
    for(SFGeometry * geometry in geometryCollection.geometries){
        SFGeometry * toGeometry = [self transformGeometry:geometry];
        [to addGeometry:toGeometry];
    }

    return to;
}

@end
