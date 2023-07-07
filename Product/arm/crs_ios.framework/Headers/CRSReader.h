//
//  CRSReader.h
//  crs-ios
//
//  Created by Brian Osborn on 7/22/21.
//  Copyright © 2021 NGA. All rights reserved.
//

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
#import "CRSTextReader.h"
#import "CRSKeyword.h"

/**
 * Well-Known Text reader
 */
@interface CRSReader : NSObject

/**
 * Read a Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Coordinate Reference System
 */
+(CRSObject *) read: (NSString *) text;

/**
 * Read a Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @param strict
 *            strict enforcement
 * @return Coordinate Reference System
 */
+(CRSObject *) read: (NSString *) text withStrict: (BOOL) strict;

/**
 * Read a Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @param expected
 *            expected types
 * @return Coordinate Reference System
 */
+(CRSObject *) read: (NSString *) text withType: (enum CRSType) expected;

/**
 * Read a Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @param expected
 *            expected types
 * @return Coordinate Reference System
 */
+(CRSObject *) read: (NSString *) text withTypes: (NSArray<NSNumber *> *) expected;

/**
 * Read a Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @param strict
 *            strict enforcement
 * @param expected
 *            expected type
 * @return Coordinate Reference System
 */
+(CRSObject *) read: (NSString *) text withStrict: (BOOL) strict andType: (enum CRSType) expected;

/**
 * Read a Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @param strict
 *            strict enforcement
 * @param expected
 *            expected types
 * @return Coordinate Reference System
 */
+(CRSObject *) read: (NSString *) text withStrict: (BOOL) strict andTypes: (NSArray<NSNumber *> *) expected;

/**
 * Read a Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Coordinate Reference System
 */
+(CRSCoordinateReferenceSystem *) readCoordinateReferenceSystem: (NSString *) text;

/**
 * Read a Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @param strict
 *            strict enforcement
 * @return Coordinate Reference System
 */
+(CRSCoordinateReferenceSystem *) readCoordinateReferenceSystem: (NSString *) text withStrict: (BOOL) strict;

/**
 * Read a Simple Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Simple Coordinate Reference System
 */
+(CRSSimpleCoordinateReferenceSystem *) readSimpleCoordinateReferenceSystem: (NSString *) text;

/**
 * Read a Simple Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @param strict
 *            strict enforcement
 * @return Simple Coordinate Reference System
 */
+(CRSSimpleCoordinateReferenceSystem *) readSimpleCoordinateReferenceSystem: (NSString *) text withStrict: (BOOL) strict;

/**
 * Read a Geodetic or Geographic Coordinate Reference System from the
 * well-known text
 *
 * @param text
 *            well-known text
 * @return Geodetic or Geographic Coordinate Reference System
 */
+(CRSGeoCoordinateReferenceSystem *) readGeo: (NSString *) text;

/**
 * Read a Geodetic Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Geodetic Coordinate Reference System
 */
+(CRSGeoCoordinateReferenceSystem *) readGeodetic: (NSString *) text;

/**
 * Read a Geographic Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Geographic Coordinate Reference System
 */
+(CRSGeoCoordinateReferenceSystem *) readGeographic: (NSString *) text;

/**
 * Read a Projected Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Projected Coordinate Reference System
 */
+(CRSProjectedCoordinateReferenceSystem *) readProjected: (NSString *) text;

/**
 * Read a Projected Geodetic Coordinate Reference System from the well-known
 * text
 *
 * @param text
 *            well-known text
 * @return Projected Geodetic Coordinate Reference System
 */
+(CRSProjectedCoordinateReferenceSystem *) readProjectedGeodetic: (NSString *) text;

/**
 * Read a Projected Geographic Coordinate Reference System from the
 * well-known text
 *
 * @param text
 *            well-known text
 * @return Projected Geographic Coordinate Reference System
 */
+(CRSProjectedCoordinateReferenceSystem *) readProjectedGeographic: (NSString *) text;

/**
 * Read a Vertical Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Vertical Coordinate Reference System
 */
+(CRSVerticalCoordinateReferenceSystem *) readVertical: (NSString *) text;

/**
 * Read an Engineering Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Engineering Coordinate Reference System
 */
+(CRSEngineeringCoordinateReferenceSystem *) readEngineering: (NSString *) text;

/**
 * Read an Parametric Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Parametric Coordinate Reference System
 */
+(CRSParametricCoordinateReferenceSystem *) readParametric: (NSString *) text;

/**
 * Read an Temporal Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Temporal Coordinate Reference System
 */
+(CRSTemporalCoordinateReferenceSystem *) readTemporal: (NSString *) text;

/**
 * Read a Derived Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Derived Coordinate Reference System
 */
+(CRSDerivedCoordinateReferenceSystem *) readDerived: (NSString *) text;

/**
 * Read a Compound Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Compound Coordinate Reference System
 */
+(CRSCompoundCoordinateReferenceSystem *) readCompound: (NSString *) text;

/**
 * Read Coordinate Metadata from the well-known text
 *
 * @param text
 *            well-known text
 * @return Coordinate Metadata
 */
+(CRSCoordinateMetadata *) readCoordinateMetadata: (NSString *) text;

/**
 * Read Coordinate Operation from the well-known text
 *
 * @param text
 *            well-known text
 * @return Coordinate Operation
 */
+(CRSCoordinateOperation *) readCoordinateOperation: (NSString *) text;

/**
 * Read Point Motion Operation from the well-known text
 *
 * @param text
 *            well-known text
 * @return Point Motion Operation
 */
+(CRSPointMotionOperation *) readPointMotionOperation: (NSString *) text;

/**
 * Read Concatenated Operation from the well-known text
 *
 * @param text
 *            well-known text
 * @return Concatenated Operation
 */
+(CRSConcatenatedOperation *) readConcatenatedOperation: (NSString *) text;

/**
 * Read Bound Coordinate Reference System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Bound Coordinate Reference System
 */
+(CRSBoundCoordinateReferenceSystem *) readBound: (NSString *) text;

/**
 * Read a Backward Compatible Geodetic or Geographic Coordinate Reference
 * System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Geodetic or Geographic Coordinate Reference System
 */
+(CRSGeoCoordinateReferenceSystem *) readGeoCompat: (NSString *) text;

/**
 * Read a Backward Compatible Geodetic Coordinate Reference System from the
 * well-known text
 *
 * @param text
 *            well-known text
 * @return Geodetic Coordinate Reference System
 */
+(CRSGeoCoordinateReferenceSystem *) readGeodeticCompat: (NSString *) text;

/**
 * Read a Backward Compatible Geographic Coordinate Reference System from
 * the well-known text
 *
 * @param text
 *            well-known text
 * @return Geographic Coordinate Reference System
 */
+(CRSGeoCoordinateReferenceSystem *) readGeographicCompat: (NSString *) text;

/**
 * Read a Backward Compatible Projected Coordinate Reference System from the
 * well-known text
 *
 * @param text
 *            well-known text
 * @return Projected Coordinate Reference System
 */
+(CRSProjectedCoordinateReferenceSystem *) readProjectedCompat: (NSString *) text;

/**
 * Read a Backward Compatible Projected Geodetic Coordinate Reference System
 * from the well-known text
 *
 * @param text
 *            well-known text
 * @return Projected Geodetic Coordinate Reference System
 */
+(CRSProjectedCoordinateReferenceSystem *) readProjectedGeodeticCompat: (NSString *) text;

/**
 * Read a Backward Compatible Projected Geographic Coordinate Reference
 * System from the well-known text
 *
 * @param text
 *            well-known text
 * @return Projected Geographic Coordinate Reference System
 */
+(CRSProjectedCoordinateReferenceSystem *) readProjectedGeographicCompat: (NSString *) text;

/**
 *  Strict rule enforcement
 */
@property (nonatomic) BOOL strict;

/**
 * Create
 *
 * @param text well-known text
 */
+(CRSReader *) createWithText: (NSString *) text;

/**
 * Create
 *
 * @param reader text reader
 */
+(CRSReader *) createWithReader: (CRSTextReader *) reader;

/**
 * Create
 *
 * @param text well-known text
 * @param strict strict rule enforcement
 */
+(CRSReader *) createWithText: (NSString *) text andStrict: (BOOL) strict;

/**
 * Create
 *
 * @param reader text reader
 * @param strict strict rule enforcement
 */
+(CRSReader *) createWithReader: (CRSTextReader *) reader andStrict: (BOOL) strict;

/**
 * Initializer
 *
 * @param text well-known text
 */
-(instancetype) initWithText: (NSString *) text;

/**
 * Initializer
 *
 * @param reader text reader
 */
-(instancetype) initWithReader: (CRSTextReader *) reader;

/**
 * Initializer
 *
 * @param text well-known text
 * @param strict strict rule enforcement
 */
-(instancetype) initWithText: (NSString *) text andStrict: (BOOL) strict;

/**
 * Initializer
 *
 * @param reader text reader
 * @param strict strict rule enforcement
 */
-(instancetype) initWithReader: (CRSTextReader *) reader andStrict: (BOOL) strict;

/**
 * Get the text reader
 *
 * @return text reader
 */
-(CRSTextReader *) textReader;

/**
 * Reset the reader
 */
-(void) reset;

/**
 * Read a CRS object from the well-known text
 *
 * @return CRS
 */
-(CRSObject *) read;

/**
 * Read a Coordinate Reference System from the well-known text
 *
 * @return Coordinate Reference System
 */
-(CRSCoordinateReferenceSystem *) readCoordinateReferenceSystem;

/**
 * Read a Simple Coordinate Reference System from the well-known text
 *
 * @return Simple Coordinate Reference System
 */
-(CRSSimpleCoordinateReferenceSystem *) readSimpleCoordinateReferenceSystem;

/**
 * Read a WKT CRS keyword
 *
 * @return keyword
 */
-(CRSKeyword *) readKeyword;

/**
 * Read a WKT CRS keyword type
 *
 * @return keyword type
 */
-(enum CRSKeywordType) readKeywordType;

/**
 * Read WKT CRS keywords
 *
 * @return keywords
 */
-(NSArray<CRSKeyword *> *) readKeywords;

/**
 * Read WKT CRS keyword types
 *
 * @return keyword types
 */
-(NSArray<NSNumber *> *) readKeywordTypes;

/**
 * Read a specific WKT CRS keyword, next token when strict, until found when
 * not
 *
 * @param keyword
 *            read until keyword
 * @return keyword read
 */
-(CRSKeyword *) readKeywordWithType: (enum CRSKeywordType) keyword;

/**
 * Read a specific WKT CRS keyword, next token when strict, until found when
 * not
 *
 * @param keywords
 *            read until one of the keywords
 * @return keyword read
 */
-(CRSKeyword *) readKeywordWithTypes: (NSArray<NSNumber *> *) keywords;

/**
 * Read skipping tokens up until before an optional WKT CRS keyword
 *
 * @param keyword
 *            read until keyword
 * @return next keyword or null
 */
-(CRSKeyword *) readToKeyword: (enum CRSKeywordType) keyword;

/**
 * Read skipping tokens up until before an optional WKT CRS keyword
 *
 * @param keywords
 *            read until one of the keywords
 * @return next keyword or null
 */
-(CRSKeyword *) readToKeywords: (NSArray<NSNumber *> *) keywords;

/**
 * Read looking for a specific WKT CRS keyword, skipping others if not
 * strict mode
 *
 * @param keyword
 *            read until keyword
 * @param required
 *            true if keyword is required, read only until an external right
 *            delimiter
 * @return keyword read
 */
-(CRSKeyword *) readKeywordWithType: (enum CRSKeywordType) keyword andRequired: (BOOL) required;

/**
 * Read looking for a specific WKT CRS keyword, skipping others if not
 * strict mode
 *
 * @param keywords
 *            read until one of the keywords
 * @param required
 *            true if keyword is required, read only until an external right
 *            delimiter
 * @return keyword read
 */
-(CRSKeyword *) readKeywordWithTypes: (NSArray<NSNumber *> *) keywords andRequired: (BOOL) required;

/**
 * Peek a WKT CRS keyword
 *
 * @return keyword
 */
-(CRSKeyword *) peekKeyword;

/**
 * Peek a WKT CRS keyword type
 *
 * @return keyword type
 */
-(enum CRSKeywordType) peekKeywordType;

/**
 * Peek WKT CRS keywords
 *
 * @return keywords
 */
-(NSArray<CRSKeyword *> *) peekKeywords;

/**
 * Peek WKT CRS keyword types
 *
 * @return keyword types
 */
-(NSArray<NSNumber *> *) peekKeywordTypes;

/**
 * Peek an optional WKT CRS keyword
 *
 * @return keyword
 */
-(CRSKeyword *) peekOptionalKeyword;

/**
 * Peek an optional WKT CRS keyword type
 *
 * @return keyword type
 */
-(enum CRSKeywordType) peekOptionalKeywordType;

/**
 * Peek at optional WKT CRS keywords
 *
 * @return keywords
 */
-(NSArray<CRSKeyword *> *) peekOptionalKeywords;

/**
 * Peek at optional WKT CRS keyword types
 *
 * @return keyword types
 */
-(NSArray<NSNumber *> *) peekOptionalKeywordTypes;

/**
 * Peek an optional WKT CRS keyword
 *
 * @param num
 *            number of tokens out to peek at
 * @return keyword
 */
-(CRSKeyword *) peekOptionalKeywordAtNum: (int) num;

/**
 * Peek an optional WKT CRS keyword type
 *
 * @param num
 *            number of tokens out to peek at
 * @return keyword type
 */
-(enum CRSKeywordType) peekOptionalKeywordTypeAtNum: (int) num;

/**
 * Peek at optional WKT CRS keywords
 *
 * @param num
 *            number of tokens out to peek at
 * @return keywords
 */
-(NSArray<CRSKeyword *> *) peekOptionalKeywordsAtNum: (int) num;

/**
 * Peek at optional WKT CRS keyword types
 *
 * @param num
 *            number of tokens out to peek at
 * @return keyword types
 */
-(NSArray<NSNumber *> *) peekOptionalKeywordTypesAtNum: (int) num;

/**
 * Read a left delimiter
 */
-(void) readLeftDelimiter;

/**
 * Peek if the next token is a left delimiter
 *
 * @return true if next token is a left delimiter
 */
-(BOOL) peekLeftDelimiter;

/**
 * Read skipping tokens until an external right delimiter (first right
 * delimiter without a preceding left)
 */
-(void) readRightDelimiter;

/**
 * Peek if the next token is a right delimiter
 *
 * @return true if next token is a right delimiter
 */
-(BOOL) peekRightDelimiter;

/**
 * Read a WKT Separator (comma)
 */
-(void) readSeparator;

/**
 * Peek if the next token is a WKT Separator (comma)
 *
 * @return true if next token is a separator
 */
-(BOOL) peekSeparator;

/**
 * "Read" an expected end, checking for unexpected trailing tokens
 */
-(void) readEnd;

/**
 * Read a keyword delimited token
 *
 * @param keyword
 *            expected keyword
 * @return token
 */
-(NSString *) readKeywordDelimitedToken: (enum CRSKeywordType) keyword;

/**
 * Read a Geodetic or Geographic CRS
 *
 * @return geodetic, geographic, or derived coordinate reference system
 */
-(CRSCoordinateReferenceSystem *) readGeo;

/**
 * Read a Projected CRS
 *
 * @return projected coordinate reference system
 */
-(CRSProjectedCoordinateReferenceSystem *) readProjected;

/**
 * Read a Projected Geodetic CRS
 *
 * @return projected geodetic coordinate reference system
 */
-(CRSProjectedCoordinateReferenceSystem *) readProjectedGeodetic;

/**
 * Read a Projected Geographic CRS
 *
 * @return projected geographic coordinate reference system
 */
-(CRSProjectedCoordinateReferenceSystem *) readProjectedGeographic;

/**
 * Read a Projected CRS
 *
 * @param expectedBaseType
 *            expected base coordinate reference system type
 *
 * @return projected coordinate reference system
 */
-(CRSProjectedCoordinateReferenceSystem *) readProjectedWithType: (enum CRSType) expectedBaseType;

/**
 * Read a Vertical CRS
 *
 * @return vertical coordinate reference system
 */
-(CRSCoordinateReferenceSystem *) readVertical;

/**
 * Read an Engineering CRS
 *
 * @return engineering coordinate reference system
 */
-(CRSCoordinateReferenceSystem *) readEngineering;

/**
 * Read a Parametric CRS
 *
 * @return parametric coordinate reference system
 */
-(CRSCoordinateReferenceSystem *) readParametric;

/**
 * Read a Temporal CRS
 *
 * @return temporal coordinate reference system
 */
-(CRSCoordinateReferenceSystem *) readTemporal;

/**
 * Read a Derived Projected CRS
 *
 * @return derived coordinate reference system
 */
-(CRSDerivedCoordinateReferenceSystem *) readDerivedProjected;

/**
 * Read a Compound CRS
 *
 * @return compound coordinate reference system
 */
-(CRSCompoundCoordinateReferenceSystem *) readCompound;

/**
 * Read Coordinate Metadata
 *
 * @return coordinate metadata
 */
-(CRSCoordinateMetadata *) readCoordinateMetadata;

/**
 * Read Coordinate Operation
 *
 * @return coordinate operation
 */
-(CRSCoordinateOperation *) readCoordinateOperation;

/**
 * Read Point Motion Operation
 *
 * @return point motion operation
 */
-(CRSPointMotionOperation *) readPointMotionOperation;

/**
 * Read Concatenated Operation
 *
 * @return concatenated operation
 */
-(CRSConcatenatedOperation *) readConcatenatedOperation;

/**
 * Read a Bound CRS
 *
 * @return bound coordinate reference system
 */
-(CRSBoundCoordinateReferenceSystem *) readBound;

/**
 * Read the usages (scope and extent), identifiers, and remark into the
 * object
 *
 * @param object
 *            scope extent identifier remark object
 */
-(void) readScopeExtentIdentifierRemark: (NSObject<CRSScopeExtentIdentifierRemark> *) object;

/**
 * Read a Geo reference frame
 *
 * @return geo reference frame
 */
-(CRSGeoReferenceFrame *) readGeoReferenceFrame;

/**
 * Read a Geo reference frame
 *
 * @param crs
 *            coordinate reference system
 *
 * @return geo reference frame
 */
-(CRSGeoReferenceFrame *) readGeoReferenceFrameWithCRS: (CRSSimpleCoordinateReferenceSystem *) crs;

/**
 * Read a Vertical reference frame
 *
 * @return vertical reference frame
 */
-(CRSVerticalReferenceFrame *) readVerticalReferenceFrame;

/**
 * Read a Vertical reference frame
 *
 * @param crs
 *            coordinate reference system
 *
 * @return vertical reference frame
 */
-(CRSVerticalReferenceFrame *) readVerticalReferenceFrameWithCRS: (CRSSimpleCoordinateReferenceSystem *) crs;

/**
 * Read an Engineering datum
 *
 * @return engineering datum
 */
-(CRSEngineeringDatum *) readEngineeringDatum;

/**
 * Read an Engineering datum
 *
 * @param crs
 *            coordinate reference system
 *
 * @return engineering datum
 */
-(CRSEngineeringDatum *) readEngineeringDatumWithCRS: (CRSSimpleCoordinateReferenceSystem *) crs;

/**
 * Read a Parametric datum
 *
 * @return parametric datum
 */
-(CRSParametricDatum *) readParametricDatum;

/**
 * Read a Parametric datum
 *
 * @param crs
 *            coordinate reference system
 *
 * @return parametric datum
 */
-(CRSParametricDatum *) readParametricDatumWithCRS: (CRSSimpleCoordinateReferenceSystem *) crs;

/**
 * Read a Reference frame (datum)
 *
 * @return reference frame
 */
-(CRSReferenceFrame *) readReferenceFrame;

/**
 * Read a Reference frame (datum)
 *
 * @param crs
 *            coordinate reference system
 *
 * @return reference frame
 */
-(CRSReferenceFrame *) readReferenceFrameWithCRS: (CRSSimpleCoordinateReferenceSystem *) crs;

/**
 * Read a Geo datum ensemble
 *
 * @return geo datum ensemble
 */
-(CRSGeoDatumEnsemble *) readGeoDatumEnsemble;

/**
 * Read a Vertical datum ensemble
 *
 * @return vertical datum ensemble
 */
-(CRSVerticalDatumEnsemble *) readVerticalDatumEnsemble;

/**
 * Read a Datum ensemble
 *
 * @return datum ensemble
 */
-(CRSDatumEnsemble *) readDatumEnsemble;

/**
 * Read a Datum ensemble member
 *
 * @return datum ensemble member
 */
-(CRSDatumEnsembleMember *) readDatumEnsembleMember;

/**
 * Read a Dynamic coordinate reference system
 *
 * @return dynamic
 */
-(CRSDynamic *) readDynamic;

/**
 * Read a Prime meridian
 *
 * @return prime meridian
 */
-(CRSPrimeMeridian *) readPrimeMeridian;

/**
 * Read an Ellipsoid
 *
 * @return ellipsoid
 */
-(CRSEllipsoid *) readEllipsoid;

/**
 * Read a Unit
 *
 * @return unit
 */
-(CRSUnit *) readUnit;

/**
 * Read an Angle Unit
 *
 * @return angle unit
 */
-(CRSUnit *) readAngleUnit;

/**
 * Read a Length Unit
 *
 * @return length unit
 */
-(CRSUnit *) readLengthUnit;

/**
 * Read a Parametric Unit
 *
 * @return parametric unit
 */
-(CRSUnit *) readParametricUnit;

/**
 * Read a Scale Unit
 *
 * @return scale unit
 */
-(CRSUnit *) readScaleUnit;

/**
 * Read a Time Unit
 *
 * @return time unit
 */
-(CRSUnit *) readTimeUnit;

/**
 * Read a Unit
 *
 * @param type
 *            expected unit type
 * @return unit
 */
-(CRSUnit *) readUnitWithType: (enum CRSUnitType) type;

/**
 * Read Identifiers
 *
 * @return identifiers
 */
-(NSMutableArray<CRSIdentifier *> *) readIdentifiers;

/**
 * Read an Identifier
 *
 * @return identifier
 */
-(CRSIdentifier *) readIdentifier;

/**
 * Read a Coordinate system
 *
 * @return coordinate system
 */
-(CRSCoordinateSystem *) readCoordinateSystem;

/**
 * Read Axes
 *
 * @return axes
 */
-(NSMutableArray<CRSAxis *> *) readAxes;

/**
 * Read Axes
 *
 * @param type
 *            coordinate system type
 *
 * @return axes
 */
-(NSMutableArray<CRSAxis *> *) readAxesWithType: (enum CRSCoordinateSystemType) type;

/**
 * Read an Axis
 *
 * @return axis
 */
-(CRSAxis *) readAxis;

/**
 * Read an Axis
 *
 * @param type
 *            coordinate system type
 * @return axis
 */
-(CRSAxis *) readAxisWithType: (enum CRSCoordinateSystemType) type;

/**
 * Read Remark
 *
 * @return remark
 */
-(NSString *) readRemark;

/**
 * Read Usages
 *
 * @return usages
 */
-(NSMutableArray<CRSUsage *> *) readUsages;

/**
 * Read a Usage
 *
 * @return usage
 */
-(CRSUsage *) readUsage;

/**
 * Read a Scope
 *
 * @return scope
 */
-(NSString *) readScope;

/**
 * Read an Extent
 *
 * @return extent
 */
-(CRSExtent *) readExtent;

/**
 * Read an Area description
 *
 * @return area description
 */
-(NSString *) readAreaDescription;

/**
 * Read a Geographic bounding box
 *
 * @return geographic bounding box
 */
-(CRSGeographicBoundingBox *) readGeographicBoundingBox;

/**
 * Read a Vertical extent
 *
 * @return vertical extent
 */
-(CRSVerticalExtent *) readVerticalExtent;

/**
 * Read a Temporal extent
 *
 * @return temporal extent
 */
-(CRSTemporalExtent *) readTemporalExtent;

/**
 * Read a Map projection
 *
 * @return map projection
 */
-(CRSMapProjection *) readMapProjection;

/**
 * Read an operation method
 *
 * @return operation method
 */
-(CRSOperationMethod *) readMethod;

/**
 * Read projected parameters
 *
 * @return operation parameters
 */
-(NSMutableArray<CRSOperationParameter *> *) readProjectedParameters;

/**
 * Read Operation parameters
 *
 * @param type
 *            coordinate reference system type
 *
 * @return operation parameters
 */
-(NSMutableArray<CRSOperationParameter *> *) readParametersWithType: (enum CRSType) type;

/**
 * Read an Operation parameter
 *
 * @param type
 *            coordinate reference system type
 *
 * @return operation parameter
 */
-(CRSOperationParameter *) readParameterWithType: (enum CRSType) type;

/**
 * Read a Temporal Datum
 *
 * @return temporal datum
 */
-(CRSTemporalDatum *) readTemporalDatum;

/**
 * Read a Deriving Conversion
 *
 * @return deriving conversion
 */
-(CRSDerivingConversion *) readDerivingConversion;

/**
 * Read Derived parameters
 *
 * @return derived parameters
 */
-(NSMutableArray<CRSOperationParameter *> *) readDerivedParameters;

/**
 * Read Operation parameters and parameter files
 *
 * @param type
 *            coordinate reference system type
 *
 * @return operation parameters
 */
-(NSMutableArray<CRSOperationParameter *> *) readParametersAndFilesWithType: (enum CRSType) type;

/**
 * Read an Operation parameter file
 *
 * @return operation parameter file
 */
-(CRSOperationParameter *) readParameterFile;

/**
 * Read Coordinate Operation parameters
 *
 * @return parameters
 */
-(NSMutableArray<CRSOperationParameter *> *) readCoordinateOperationParameters;

/**
 * Read an operation version
 *
 * @return operation version
 */
-(NSString *) readVersion;

/**
 * Read a source coordinate reference system
 *
 * @return source crs
 */
-(CRSCoordinateReferenceSystem *) readSource;

/**
 * Read a target coordinate reference system
 *
 * @return target crs
 */
-(CRSCoordinateReferenceSystem *) readTarget;

/**
 * Read a interpolation coordinate reference system
 *
 * @return interpolation crs
 */
-(CRSCoordinateReferenceSystem *) readInterpolation;

/**
 * Read a coordinate reference system with the keyword
 *
 * @param keyword
 *            CRS keyword
 *
 * @return crs
 */
-(CRSCoordinateReferenceSystem *) readCoordinateReferenceSystemWithKeyword: (enum CRSKeywordType) keyword;

/**
 * Read an operation accuracy
 *
 * @return operation accuracy
 */
-(double) readAccuracy;

/**
 * Read Point Motion Operation parameters
 *
 * @return parameters
 */
-(NSMutableArray<CRSOperationParameter *> *) readPointMotionOperationParameters;

/**
 * Read an Abridged Coordinate Transformation
 *
 * @return abridged coordinate transformation
 */
-(CRSAbridgedCoordinateTransformation *) readAbridgedCoordinateTransformation;

/**
 * Read Bound CRS Abridged Transformation parameters
 *
 * @return parameters
 */
-(NSMutableArray<CRSOperationParameter *> *) readBoundParameters;

/**
 * Read a Backward Compatible Geodetic or Geographic CRS
 *
 * @return geodetic or geographic coordinate reference system
 */
-(CRSGeoCoordinateReferenceSystem *) readGeoCompat;

/**
 * Read a Backward Compatible Geodetic CRS
 *
 * @return geodetic coordinate reference system
 */
-(CRSGeoCoordinateReferenceSystem *) readGeodeticCompat;

/**
 * Read a Backward Compatible Geographic CRS
 *
 * @return geographic coordinate reference system
 */
-(CRSGeoCoordinateReferenceSystem *) readGeographicCompat;

/**
 * Read a Backward Compatible Geodetic or Geographic CRS
 *
 * @param expectedType
 *            expected coordinate reference system type
 *
 * @return geodetic or geographic coordinate reference system
 */
-(CRSGeoCoordinateReferenceSystem *) readGeoCompatWithType: (enum CRSType) expectedType;

/**
 * Read a Backward Compatible Projected CRS
 *
 * @return projected coordinate reference system
 */
-(CRSProjectedCoordinateReferenceSystem *) readProjectedCompat;

/**
 * Read a Backward Compatible Projected Geodetic CRS
 *
 * @return projected geodetic coordinate reference system
 */
-(CRSProjectedCoordinateReferenceSystem *) readProjectedGeodeticCompat;

/**
 * Read a Backward Compatible Projected Geographic CRS
 *
 * @return projected geographic coordinate reference system
 */
-(CRSProjectedCoordinateReferenceSystem *) readProjectedGeographicCompat;

/**
 * Read a Backward Compatible Projected CRS
 *
 * @param expectedBaseType
 *            expected base coordinate reference system type
 *
 * @return projected coordinate reference system
 */
-(CRSProjectedCoordinateReferenceSystem *) readProjectedCompatWithType: (enum CRSType) expectedBaseType;

/**
 * Add transform parameters to the map projection
 *
 * @param transform
 *            transform array
 * @param mapProjection
 *            map projection
 */
+(void) addTransformParameters: (NSArray<NSString *> *) transform toMapProjection: (CRSMapProjection *) mapProjection;

/**
 * Read a Backward Compatible Vertical CRS
 *
 * @return vertical coordinate reference system
 */
-(CRSVerticalCoordinateReferenceSystem *) readVerticalCompat;

/**
 * Read a Backward Compatible Engineering CRS
 *
 * @return engineering coordinate reference system
 */
-(CRSEngineeringCoordinateReferenceSystem *) readEngineeringCompat;

/**
 * Read a Backward Compatible map projection
 *
 * @return map projection
 */
-(CRSMapProjection *) readMapProjectionCompat;

/**
 * Read a Backward Compatible Coordinate System
 *
 * @param type
 *            coordinate reference system type
 * @param datum
 *            reference frame
 *
 * @return coordinate system
 */
-(CRSCoordinateSystem *) readCoordinateSystemCompatWithType: (enum CRSType) type andReferenceFrame: (CRSReferenceFrame *) datum;

/**
 * Read a Backward Compatible vertical datum
 *
 * @return vertical reference frame
 */
-(CRSVerticalReferenceFrame *) readVerticalDatumCompat;

/**
 * Read a Backward Compatible vertical datum
 *
 * @param crs
 *            coordinate reference system
 *
 * @return vertical reference frame
 */
-(CRSVerticalReferenceFrame *) readVerticalDatumCompatWithCRS: (CRSSimpleCoordinateReferenceSystem *) crs;

/**
 * Read a Backward Compatible engineering datum
 *
 * @return engineering datum
 */
-(CRSEngineeringDatum *) readEngineeringDatumCompat;

/**
 * Read a Backward Compatible engineering datum
 *
 * @param crs
 *            coordinate reference system
 *
 * @return engineering datum
 */
-(CRSEngineeringDatum *) readEngineeringDatumCompatWithCRS: (CRSSimpleCoordinateReferenceSystem *) crs;

/**
 * Read a Backward Compatible datum
 *
 * @return reference frame
 */
-(CRSReferenceFrame *) readDatumCompat;

/**
 * Read a Backward Compatible datum
 *
 * @param crs
 *            coordinate reference system
 *
 * @return reference frame
 */
-(CRSReferenceFrame *) readDatumCompatWithCRS: (CRSSimpleCoordinateReferenceSystem *) crs;

/**
 * Read a Backward Compatible To WGS84 transformation
 *
 * @return abridged transformation
 */
-(NSMutableArray<NSString *> *) readToWGS84Compat;

/**
 * Read Backward Compatible Extensions
 *
 * @return extensions
 */
-(NSMutableDictionary<NSString *, NSObject *> *) readExtensionsCompat;

@end
