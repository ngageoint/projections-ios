//
//  CRSWriter.h
//  crs-ios
//
//  Created by Brian Osborn on 7/13/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSKeyword.h"
#import "CRSProjectedCoordinateReferenceSystem.h"
#import "CRSVerticalCoordinateReferenceSystem.h"
#import "CRSEngineeringCoordinateReferenceSystem.h"
#import "CRSParametricCoordinateReferenceSystem.h"
#import "CRSTemporalCoordinateReferenceSystem.h"
#import "CRSDerivedCoordinateReferenceSystem.h"
#import "CRSCompoundCoordinateReferenceSystem.h"
#import "CRSCoordinateMetadata.h"
#import "CRSCoordinateOperation.h"
#import "CRSPointMotionOperation.h"
#import "CRSConcatenatedOperation.h"
#import "CRSBoundCoordinateReferenceSystem.h"

/**
 * Well-Known Text writer
 */
@interface CRSWriter : NSObject

/**
 * Write a coordinate reference system to well-known text
 *
 * @param crs
 *            coordinate reference system
 * @return well-known text
 */
+(NSString *) write: (CRSObject *) crs;

/**
 * Write a coordinate reference system to well-known pretty text, 4 space
 * indents
 *
 * @param crs
 *            coordinate reference system
 * @return well-known pretty text
 */
+(NSString *) writePretty: (CRSObject *) crs;

/**
 * Write a coordinate reference system to well-known pretty text, tab
 * indents
 *
 * @param crs
 *            coordinate reference system
 * @return well-known pretty text
 */
+(NSString *) writePrettyTabIndent: (CRSObject *) crs;

/**
 * Write a coordinate reference system to well-known pretty text, no indents
 *
 * @param crs
 *            coordinate reference system
 * @return well-known pretty text
 */
+(NSString *) writePrettyNoIndent: (CRSObject *) crs;

/**
 * Write a coordinate reference system to well-known pretty text
 *
 * @param crs
 *            coordinate reference system
 * @param indent
 *            indent string
 * @return well-known pretty text
 */
+(NSString *) writePretty: (CRSObject *) crs withIndent: (NSString *) indent;

/**
 * Write a coordinate reference system to well-known pretty text
 *
 * @param crs
 *            coordinate reference system
 * @param newline
 *            newline string
 * @param indent
 *            indent string
 * @return well-known pretty text
 */
+(NSString *) writePretty: (CRSObject *) crs withNewline: (NSString *) newline andIndent: (NSString *) indent;

/**
 * Write well-known text to well-known pretty text, 4 space indents
 *
 * @param wkt
 *            well-known text
 * @return well-known pretty text
 */
+(NSString *) writePrettyWithText: (NSString *) wkt;

/**
 * Write well-known text to well-known pretty text, tab indents
 *
 * @param wkt
 *            well-known text
 * @return well-known pretty text
 */
+(NSString *) writePrettyTabIndentWithText: (NSString *) wkt;

/**
 * Write well-known text to well-known pretty text, no indents
 *
 * @param wkt
 *            well-known text
 * @return well-known pretty text
 */
+(NSString *) writePrettyNoIndentWithText: (NSString *) wkt;

/**
 * Write well-known text to well-known pretty text
 *
 * @param wkt
 *            well-known text
 * @param indent
 *            indent string
 * @return well-known pretty text
 */
+(NSString *) writePrettyWithText: (NSString *) wkt andIndent: (NSString *) indent;

/**
 * Write well-known text to well-known pretty text
 *
 * @param wkt
 *            well-known text
 * @param newline
 *            newline string
 * @param indent
 *            indent string
 * @return well-known pretty text
 */
+(NSString *) writePrettyWithText: (NSString *) wkt andNewline: (NSString *) newline andIndent: (NSString *) indent;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSWriter *) create;

/**
 *  Initialize
 *
 *  @return new instance
 */
-(instancetype) init;

/**
 * Initializer
 *
 * @param text  mutable string
 */
-(instancetype) initWithText: (NSMutableString *) text;

/**
 * Get the well-known text
 *
 * @return text
 */
-(NSMutableString *) text;

/**
 * Write a CRS to well-known text
 *
 * @param crs
 *            coordinate reference system
 */
-(void) writeCRS: (CRSObject *) crs;

/**
 * Write a keyword type
 *
 * @param keyword
 *            keyword type
 */
-(void) writeKeywordType: (enum CRSKeywordType) keyword;

/**
 * Write a keyword
 *
 * @param keyword
 *            keyword
 */
-(void) writeKeyword: (CRSKeyword *) keyword;

/**
 * Write a left delimiter
 */
-(void) writeLeftDelimiter;

/**
 * Write a right delimiter
 */
-(void) writeRightDelimiter;

/**
 * Write a separator
 */
-(void) writeSeparator;

/**
 * Write the text as quoted
 *
 * @param text
 *            text
 */
-(void) writeQuotedText: (NSString *) text;

/**
 * Write a number
 *
 * @param number
 *            number
 */
-(void) writeNumber: (NSNumber *) number;

/**
 * Write a number or quoted text if not a number
 *
 * @param text
 *            text
 */
-(void) writeNumberOrQuotedText: (NSString *) text;

/**
 * Write a double
 *
 * @param value
 *            double value
 */
-(void) writeDouble: (double) value;

/**
 * Write an int
 *
 * @param value
 *            int value
 */
-(void) writeInt: (int) value;

/**
 * Write a keyword type delimited text
 *
 * @param keyword
 *            keyword type
 * @param text
 *            text
 */
-(void) writeKeywordType: (enum CRSKeywordType) keyword withDelimitedQuotedText: (NSString *) text;

/**
 * Write a keyword delimited text
 *
 * @param keyword
 *            keyword
 * @param text
 *            text
 */
-(void) writeKeyword: (CRSKeyword *) keyword withDelimitedQuotedText: (NSString *) text;

/**
 * Write a geodetic or geographic CRS to well-known text
 *
 * @param crs
 *            geodetic or geographic coordinate reference system
 */
-(void) writeGeo: (CRSGeoCoordinateReferenceSystem *) crs;

/**
 * Write a projected CRS to well-known text
 *
 * @param crs
 *            projected coordinate reference system
 */
-(void) writeProjected: (CRSProjectedCoordinateReferenceSystem *) crs;

/**
 * Write a vertical CRS to well-known text
 *
 * @param crs
 *            vertical coordinate reference system
 */
-(void) writeVertical: (CRSVerticalCoordinateReferenceSystem *) crs;

/**
 * Write an engineering CRS to well-known text
 *
 * @param crs
 *            engineering coordinate reference system
 */
-(void) writeEngineering: (CRSEngineeringCoordinateReferenceSystem *) crs;

/**
 * Write a parametric CRS to well-known text
 *
 * @param crs
 *            parametric coordinate reference system
 */
-(void) writeParametric: (CRSParametricCoordinateReferenceSystem *) crs;

/**
 * Write a temporal CRS to well-known text
 *
 * @param crs
 *            temporal coordinate reference system
 */
-(void) writeTemporal: (CRSTemporalCoordinateReferenceSystem *) crs;

/**
 * Write a derived CRS to well-known text
 *
 * @param crs
 *            temporal coordinate reference system
 */
-(void) writeDerived: (CRSDerivedCoordinateReferenceSystem *) crs;

/**
 * Write a derived geo CRS to well-known text
 *
 * @param crs
 *            derived geo coordinate reference system
 */
-(void) writeDerivedGeoCRS: (CRSDerivedCoordinateReferenceSystem *) crs;

/**
 * Write a derived projected CRS to well-known text
 *
 * @param crs
 *            derived projected coordinate reference system
 */
-(void) writeDerivedProjectedCRS: (CRSDerivedCoordinateReferenceSystem *) crs;

/**
 * Write a derived vertical CRS to well-known text
 *
 * @param crs
 *            derived vertical coordinate reference system
 */
-(void) writeDerivedVerticalCRS: (CRSDerivedCoordinateReferenceSystem *) crs;

/**
 * Write a derived engineering CRS to well-known text
 *
 * @param crs
 *            derived engineering coordinate reference system
 */
-(void) writeDerivedEngineeringCRS: (CRSDerivedCoordinateReferenceSystem *) crs;

/**
 * Write a derived parametric CRS to well-known text
 *
 * @param crs
 *            derived parametric coordinate reference system
 */
-(void) writeDerivedParametricCRS: (CRSDerivedCoordinateReferenceSystem *) crs;

/**
 * Write a derived temporal CRS to well-known text
 *
 * @param crs
 *            derived temporal coordinate reference system
 */
-(void) writeDerivedTemporalCRS: (CRSDerivedCoordinateReferenceSystem *) crs;

/**
 * Write a compound CRS to well-known text
 *
 * @param crs
 *            compound coordinate reference system
 */
-(void) writeCompound: (CRSCompoundCoordinateReferenceSystem *) crs;

/**
 * Write coordinate metadata to well-known text
 *
 * @param metadata
 *            coordinate metadata
 */
-(void) writeCoordinateMetadata: (CRSCoordinateMetadata *) metadata;

/**
 * Write coordinate operation to well-known text
 *
 * @param operation
 *            coordinate operation
 */
-(void) writeCoordinateOperation: (CRSCoordinateOperation *) operation;

/**
 * Write point motion operation to well-known text
 *
 * @param operation
 *            point motion operation
 */
-(void) writePointMotionOperation: (CRSPointMotionOperation *) operation;

/**
 * Write concatenated operation to well-known text
 *
 * @param operation
 *            concatenated operation
 */
-(void) writeConcatenatedOperation: (CRSConcatenatedOperation *) operation;

/**
 * Write a bound CRS to well-known text
 *
 * @param crs
 *            bound coordinate reference system
 */
-(void) writeBound: (CRSBoundCoordinateReferenceSystem *) crs;

/**
 * Write the CRS usages (scope and extent), identifiers, and remark
 *
 * @param object
 *            scope extent identifier remark object
 */
-(void) writeScopeExtentIdentifierRemark: (NSObject<CRSScopeExtentIdentifierRemark> *) object;

/**
 * Write a reference frame to well-known text
 *
 * @param referenceFrame
 *            reference frame
 */
-(void) writeReferenceFrame: (CRSReferenceFrame *) referenceFrame;

/**
 * Write a datum ensemble to well-known text
 *
 * @param datumEnsemble
 *            datum ensemble
 */
-(void) writeDatumEnsemble: (CRSDatumEnsemble *) datumEnsemble;

/**
 * Write a datum ensemble member to well-known text
 *
 * @param datumEnsembleMember
 *            datum ensemble member
 */
-(void) writeDatumEnsembleMember: (CRSDatumEnsembleMember *) datumEnsembleMember;

/**
 * Write a dynamic to well-known text
 *
 * @param dynamic
 *            dynamic
 */
-(void) writeDynamic: (CRSDynamic *) dynamic;

/**
 * Write a prime meridian to well-known text
 *
 * @param primeMeridian
 *            prime meridian
 */
-(void) writePrimeMeridian: (CRSPrimeMeridian *) primeMeridian;

/**
 * Write an ellipsoid to well-known text
 *
 * @param ellipsoid
 *            ellipsoid
 */
-(void) writeEllipsoid: (CRSEllipsoid *) ellipsoid;

/**
 * Write a unit to well-known text
 *
 * @param unit
 *            unit
 */
-(void) writeUnit: (CRSUnit *) unit;

/**
 * Write identifiers to well-known text
 *
 * @param identifiers
 *            identifiers
 */
-(void) writeIdentifiers: (NSArray<CRSIdentifier *> *) identifiers;

/**
 * Write an identifier to well-known text
 *
 * @param identifier
 *            identifier
 */
-(void) writeIdentifier: (CRSIdentifier *) identifier;

/**
 * Write a coordinate system to well-known text
 *
 * @param coordinateSystem
 *            coordinate system
 */
-(void) writeCoordinateSystem: (CRSCoordinateSystem *) coordinateSystem;

/**
 * Write an axis to well-known text
 *
 * @param axis
 *            axis
 */
-(void) writeAxis: (CRSAxis *) axis;

/**
 * Write a remark to well-known text
 *
 * @param remark
 *            remark
 */
-(void) writeRemark: (NSString *) remark;

/**
 * Write usages to well-known text
 *
 * @param usages
 *            usages
 */
-(void) writeUsages: (NSArray<CRSUsage *> *) usages;

/**
 * Write a usage to well-known text
 *
 * @param usage
 *            usage
 */
-(void) writeUsage: (CRSUsage *) usage;

/**
 * Write a scope to well-known text
 *
 * @param scope
 *            scope
 */
-(void) writeScope: (NSString *) scope;

/**
 * Write an extent to well-known text
 *
 * @param extent
 *            extent
 */
-(void) writeExtent: (CRSExtent *) extent;

/**
 * Write an area description to well-known text
 *
 * @param areaDescription
 *            area description
 */
-(void) writeAreaDescription: (NSString *) areaDescription;

/**
 * Write a geographic bounding box to well-known text
 *
 * @param geographicBoundingBox
 *            geographic bounding box
 */
-(void) writeGeographicBoundingBox: (CRSGeographicBoundingBox *) geographicBoundingBox;

/**
 * Write a vertical extent to well-known text
 *
 * @param verticalExtent
 *            vertical extent
 */
-(void) writeVerticalExtent: (CRSVerticalExtent *) verticalExtent;

/**
 * Write a temporal extent to well-known text
 *
 * @param temporalExtent
 *            temporal extent
 */
-(void) writeTemporalExtent: (CRSTemporalExtent *) temporalExtent;

/**
 * Write a map projection to well-known text
 *
 * @param mapProjection
 *            map projection
 */
-(void) writeMapProjection: (CRSMapProjection *) mapProjection;

/**
 * Write an operation method to well-known text
 *
 * @param method
 *            operation method
 */
-(void) writeOperationMethod: (CRSOperationMethod *) method;

/**
 * Write an operation parameter to well-known text
 *
 * @param parameter
 *            operation parameter
 */
-(void) writeOperationParameter: (CRSOperationParameter *) parameter;

/**
 * Write a temporal datum to well-known text
 *
 * @param temporalDatum
 *            temporal datum
 */
-(void) writeTemporalDatum: (CRSTemporalDatum *) temporalDatum;

/**
 * Write a deriving conversion to well-known text
 *
 * @param derivingConversion
 *            deriving conversion
 */
-(void) writeDerivingConversion: (CRSDerivingConversion *) derivingConversion;

/**
 * Write operation parameters and operation parameter files to well-known
 * text
 *
 * @param parameters
 *            operation parameters
 */
-(void) writeOperationParameters: (NSArray<CRSOperationParameter *> *) parameters;

/**
 * Write an operation version
 *
 * @param version
 *            operation version
 */
-(void) writeVersion: (NSString *) version;

/**
 * Write a source coordinate reference system
 *
 * @param crs
 *            coordinate reference system
 */
-(void) writeSource: (CRSCoordinateReferenceSystem *) crs;

/**
 * Write a target coordinate reference system
 *
 * @param crs
 *            coordinate reference system
 */
-(void) writeTarget: (CRSCoordinateReferenceSystem *) crs;

/**
 * Write a interpolation coordinate reference system
 *
 * @param crs
 *            coordinate reference system
 */
-(void) writeInterpolation: (CRSCoordinateReferenceSystem *) crs;

/**
 * Write a coordinate reference system with the keyword
 *
 * @param keyword
 *            CRS keyword
 * @param crs
 *            coordinate reference system
 */
-(void) writeCoordinateReferenceSystem: (CRSCoordinateReferenceSystem *) crs withKeywordType: (enum CRSKeywordType) keyword;

/**
 * Write an operation accuracy
 *
 * @param accuracy
 *            operation accuracy
 */
-(void) writeAccuracy: (double) accuracy;

/**
 * Write an abridged coordinate transformation
 *
 * @param transformation
 *            abridged coordinate transformation
 */
-(void) writeAbridgedCoordinateTransformation: (CRSAbridgedCoordinateTransformation *) transformation;

@end
