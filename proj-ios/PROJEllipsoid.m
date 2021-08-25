//
//  PROJEllipsoid.m
//  proj-ios
//
//  Created by Brian Osborn on 8/25/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "PROJEllipsoid.h"

@interface PROJEllipsoid()

@property (nonatomic) enum PROJEllipsoidType type;
@property (nonatomic, strong) NSArray<NSString *> *names;
@property (nonatomic, strong) NSString *shortName;
@property (nonatomic) double equatorRadius;
@property (nonatomic) double poleRadius;
@property (nonatomic) double eccentricity;
@property (nonatomic) double eccentricity2;

@end

@implementation PROJEllipsoid

/**
 * Type to Ellipsoid mapping
 */
static NSMutableDictionary<NSNumber *, PROJEllipsoid *> *typeEllipsoids = nil;

/**
 * Name and short name to Ellipsoid mapping
 */
static NSMutableDictionary<NSString *, PROJEllipsoid *> *nameEllipsoids = nil;

+(void) initialize{
    typeEllipsoids = [NSMutableDictionary dictionary];
    nameEllipsoids = [NSMutableDictionary dictionary];
 
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_INTERNATIONAL andShortName:@"intl" andEquatorRadius:6378388.0 andPoleRadius:0.0 andReciprocalFlattening:297.0 andNames:[NSArray arrayWithObjects:@"International 1909 (Hayford)", @"International 1924 (Hayford)", nil]]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_BESSEL andShortName:@"bessel" andEquatorRadius:6377397.155 andPoleRadius:0.0 andReciprocalFlattening:299.1528128 andName:@"Bessel 1841"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_CLARKE_1866 andShortName:@"clrk66" andEquatorRadius:6378206.4 andPoleRadius:6356583.8 andReciprocalFlattening:0.0 andName:@"Clarke 1866"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_CLARKE_1880 andShortName:@"clrk80" andEquatorRadius:6378249.145 andPoleRadius:0.0 andReciprocalFlattening:293.4663 andName:@"Clarke 1880 mod."]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_AIRY andShortName:@"airy" andEquatorRadius:6377563.396 andPoleRadius:6356256.910 andReciprocalFlattening:0.0 andName:@"Airy 1830"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_WGS60 andShortName:@"WGS60" andEquatorRadius:6378165.0 andPoleRadius:0.0 andReciprocalFlattening:298.3 andName:@"WGS 60"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_WGS66 andShortName:@"WGS66" andEquatorRadius:6378145.0 andPoleRadius:0.0 andReciprocalFlattening:298.25 andName:@"WGS 66"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_WGS72 andShortName:@"WGS72" andEquatorRadius:6378135.0 andPoleRadius:0.0 andReciprocalFlattening:298.26 andName:@"WGS 72"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_WGS84 andShortName:@"WGS84" andEquatorRadius:6378137.0 andPoleRadius:0.0 andReciprocalFlattening:298.257223563 andName:@"WGS 84"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_KRASSOVSKY andShortName:@"krass" andEquatorRadius:6378245.0 andPoleRadius:0.0 andReciprocalFlattening:298.3 andName:@"Krassovsky, 1942"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_EVEREST andShortName:@"evrst30" andEquatorRadius:6377276.345 andPoleRadius:0.0 andReciprocalFlattening:300.8017 andName:@"Everest 1830"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_INTERNATIONAL_1967 andShortName:@"new_intl" andEquatorRadius:6378157.5 andPoleRadius:6356772.2 andReciprocalFlattening:0.0 andName:@"New International 1967"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_GRS80 andShortName:@"GRS80" andEquatorRadius:6378137.0 andPoleRadius:0.0 andReciprocalFlattening:298.257222101 andName:@"GRS 1980 (IUGG, 1980)"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_AUSTRALIAN andShortName:@"australian" andEquatorRadius:6378160.0 andPoleRadius:6356774.7 andReciprocalFlattening:298.25 andName:@"Australian"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_MERIT andShortName:@"MERIT" andEquatorRadius:6378137.0 andPoleRadius:0.0 andReciprocalFlattening:298.257 andName:@"MERIT 1983"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_SGS85 andShortName:@"SGS85" andEquatorRadius:6378136.0 andPoleRadius:0.0 andReciprocalFlattening:298.257 andName:@"Soviet Geodetic System 85"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_IAU76 andShortName:@"IAU76" andEquatorRadius:6378140.0 andPoleRadius:0.0 andReciprocalFlattening:298.257 andName:@"IAU 1976"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_APL4_9 andShortName:@"APL4.9" andEquatorRadius:6378137.0 andPoleRadius:0.0 andReciprocalFlattening:298.25 andName:@"Appl. Physics. 1965"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_NWL9D andShortName:@"NWL9D" andEquatorRadius:6378145.0 andPoleRadius:0.0 andReciprocalFlattening:298.25 andName:@"Naval Weapons Lab., 1965"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_MOD_AIRY andShortName:@"mod_airy" andEquatorRadius:6377340.189 andPoleRadius:6356034.446 andReciprocalFlattening:0.0 andName:@"Modified Airy"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_ANDRAE andShortName:@"andrae" andEquatorRadius:6377104.43 andPoleRadius:0.0 andReciprocalFlattening:300.0 andName:@"Andrae 1876 (Den., Iclnd.)"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_AUST_SA andShortName:@"aust_SA" andEquatorRadius:6378160.0 andPoleRadius:0.0 andReciprocalFlattening:298.25 andName:@"Australian Natl & S. Amer. 1969"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_GRS67 andShortName:@"GRS67" andEquatorRadius:6378160.0 andPoleRadius:0.0 andReciprocalFlattening:298.2471674270 andName:@"GRS 67 (IUGG 1967)"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_BESS_NAM andShortName:@"bess_nam" andEquatorRadius:6377483.865 andPoleRadius:0.0 andReciprocalFlattening:299.1528128 andName:@"Bessel 1841 (Namibia)"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_CPM andShortName:@"CPM" andEquatorRadius:6375738.7 andPoleRadius:0.0 andReciprocalFlattening:334.29 andName:@"Comm. des Poids et Mesures 1799"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_DELMBR andShortName:@"delmbr" andEquatorRadius:6376428.0 andPoleRadius:0.0 andReciprocalFlattening:311.5 andName:@"Delambre 1810 (Belgium)"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_ENGELIS andShortName:@"engelis" andEquatorRadius:6378136.05 andPoleRadius:0.0 andReciprocalFlattening:298.2566 andName:@"Engelis 1985"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_EVRST48 andShortName:@"evrst48" andEquatorRadius:6377304.063 andPoleRadius:0.0 andReciprocalFlattening:300.8017 andName:@"Everest 1948"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_EVRST56 andShortName:@"evrst56" andEquatorRadius:6377301.243 andPoleRadius:0.0 andReciprocalFlattening:300.8017 andName:@"Everest 1956"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_EVRTS69 andShortName:@"evrst69" andEquatorRadius:6377295.664 andPoleRadius:0.0 andReciprocalFlattening:300.8017 andName:@"Everest 1969"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_EVRTSTSS andShortName:@"evrstSS" andEquatorRadius:6377298.556 andPoleRadius:0.0 andReciprocalFlattening:300.8017 andName:@"Everest (Sabah & Sarawak)"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_FRSCH60 andShortName:@"fschr60" andEquatorRadius:6378166.0 andPoleRadius:0.0 andReciprocalFlattening:298.3 andName:@"Fischer (Mercury Datum) 1960"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_FSRCH60M andShortName:@"fschr60m" andEquatorRadius:6378155.0 andPoleRadius:0.0 andReciprocalFlattening:298.3 andName:@"Modified Fischer 1960"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_FSCHR68 andShortName:@"fschr68" andEquatorRadius:6378150.0 andPoleRadius:0.0 andReciprocalFlattening:298.3 andName:@"Fischer 1968"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_HELMERT andShortName:@"helmert" andEquatorRadius:6378200.0 andPoleRadius:0.0 andReciprocalFlattening:298.3 andName:@"Helmert 1906"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_HOUGH andShortName:@"hough" andEquatorRadius:6378270.0 andPoleRadius:0.0 andReciprocalFlattening:297.0 andName:@"Hough"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_KAULA andShortName:@"kaula" andEquatorRadius:6378163.0 andPoleRadius:0.0 andReciprocalFlattening:298.24 andName:@"Kaula 1961"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_LERCH andShortName:@"lerch" andEquatorRadius:6378139.0 andPoleRadius:0.0 andReciprocalFlattening:298.257 andName:@"Lerch 1979"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_MPRTS andShortName:@"mprts" andEquatorRadius:6397300.0 andPoleRadius:0.0 andReciprocalFlattening:191.0 andName:@"Maupertius 1738"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_PLESSIS andShortName:@"plessis" andEquatorRadius:6376523.0 andPoleRadius:6355863.0 andReciprocalFlattening:0.0 andName:@"Plessis 1817 (France)"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_SEASIA andShortName:@"SEasia" andEquatorRadius:6378155.0 andPoleRadius:6356773.3205 andReciprocalFlattening:0.0 andName:@"Southeast Asia"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_WALBECK andShortName:@"walbeck" andEquatorRadius:6376896.0 andPoleRadius:6355834.8467 andReciprocalFlattening:0.0 andName:@"Walbeck"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_NAD27 andShortName:@"NAD27" andEquatorRadius:6378249.145 andPoleRadius:0.0 andReciprocalFlattening:293.4663 andName:@"NAD27: Clarke 1880 mod."]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_NAD83 andShortName:@"NAD83" andEquatorRadius:6378137.0 andPoleRadius:0.0 andReciprocalFlattening:298.257222101 andName:@"NAD83: GRS 1980 (IUGG, 1980)"]];
    [self initializeEllipsoid:[PROJEllipsoid createWithType:PROJ_ELLIPSOID_SPHERE andShortName:@"sphere" andEquatorRadius:6371008.7714 andPoleRadius:6371008.7714 andReciprocalFlattening:0.0 andName:@"Sphere"]];
    
}

+(void) initializeEllipsoid: (PROJEllipsoid *) ellipsoid{
    
    [typeEllipsoids setObject:ellipsoid forKey:[NSNumber numberWithInt:ellipsoid.type]];
    
    [nameEllipsoids setObject:ellipsoid forKey:[ellipsoid.shortName lowercaseString]];
    for(NSString *name in ellipsoid.names){
        NSString *lowercaseName = [name lowercaseString];
        [nameEllipsoids setObject:ellipsoid forKey:lowercaseName];
        NSRange range = [lowercaseName rangeOfString:@"("];
        if(range.length > 0){
            NSString *namePrefix = [[lowercaseName substringToIndex:range.location] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            [nameEllipsoids setObject:ellipsoid forKey:namePrefix];
        }
    }
}

+(PROJEllipsoid *) createWithType: (enum PROJEllipsoidType) type andShortName: (NSString *) shortName andEquatorRadius: (double) equatorRadius andPoleRadius: (double) poleRadius andReciprocalFlattening: (double) reciprocalFlattening andName: (NSString *) name{
    return [[PROJEllipsoid alloc] initWithType:type andShortName:shortName andEquatorRadius:equatorRadius andPoleRadius:poleRadius andReciprocalFlattening:reciprocalFlattening andName:name];
}

+(PROJEllipsoid *) createWithType: (enum PROJEllipsoidType) type andShortName: (NSString *) shortName andEquatorRadius: (double) equatorRadius andEccentricity2: (double) eccentricity2 andName: (NSString *) name{
    return [[PROJEllipsoid alloc] initWithType:type andShortName:shortName andEquatorRadius:equatorRadius andEccentricity2:eccentricity2 andName:name];
}

+(PROJEllipsoid *) createWithType: (enum PROJEllipsoidType) type andShortName: (NSString *) shortName andEquatorRadius: (double) equatorRadius andPoleRadius: (double) poleRadius andReciprocalFlattening: (double) reciprocalFlattening andNames: (NSArray<NSString *> *) names{
    return [[PROJEllipsoid alloc] initWithType:type andShortName:shortName andEquatorRadius:equatorRadius andPoleRadius:poleRadius andReciprocalFlattening:reciprocalFlattening andNames:names];
}

+(PROJEllipsoid *) createWithType: (enum PROJEllipsoidType) type andShortName: (NSString *) shortName andEquatorRadius: (double) equatorRadius andEccentricity2: (double) eccentricity2 andNames: (NSArray<NSString *> *) names{
    return [[PROJEllipsoid alloc] initWithType:type andShortName:shortName andEquatorRadius:equatorRadius andEccentricity2:eccentricity2 andNames:names];
}

+(PROJEllipsoid *) fromType: (enum PROJEllipsoidType) type{
    return [typeEllipsoids objectForKey:[NSNumber numberWithInt:type]];
}

+(PROJEllipsoid *) fromName: (NSString *) name{
    return [nameEllipsoids objectForKey:[name lowercaseString]];
}

-(instancetype) initWithType: (enum PROJEllipsoidType) type andShortName: (NSString *) shortName andEquatorRadius: (double) equatorRadius andPoleRadius: (double) poleRadius andReciprocalFlattening: (double) reciprocalFlattening andName: (NSString *) name{
    return [self initWithType:type andShortName:shortName andEquatorRadius:equatorRadius andPoleRadius:poleRadius andReciprocalFlattening:reciprocalFlattening andNames:[NSArray arrayWithObject:name]];
}

-(instancetype) initWithType: (enum PROJEllipsoidType) type andShortName: (NSString *) shortName andEquatorRadius: (double) equatorRadius andEccentricity2: (double) eccentricity2 andName: (NSString *) name{
    return [self initWithType:type andShortName:shortName andEquatorRadius:equatorRadius andEccentricity2:eccentricity2 andNames:[NSArray arrayWithObject:name]];
}

-(instancetype) initWithType: (enum PROJEllipsoidType) type andShortName: (NSString *) shortName andEquatorRadius: (double) equatorRadius andPoleRadius: (double) poleRadius andReciprocalFlattening: (double) reciprocalFlattening andNames: (NSArray<NSString *> *) names{
    self = [super init];
    if(self != nil){
        _type = type;
        _shortName = shortName;
        _names = names;
        _equatorRadius = equatorRadius;
        _poleRadius = poleRadius;
        
        if(poleRadius == 0.0 && reciprocalFlattening == 0.0){
            [NSException raise:@"Invalid Ellipsoid" format:@"One of poleRadius or reciprocalFlattening must be specified"];
        }

        if(reciprocalFlattening != 0){
            double flattening = 1.0 / reciprocalFlattening;
            double f = flattening;
            _eccentricity2 = 2 * f - f * f;
            _poleRadius = equatorRadius * sqrt(1.0 - _eccentricity2);
        } else {
            _eccentricity2 = 1.0 - (poleRadius * poleRadius)
                    / (equatorRadius * equatorRadius);
        }
        _eccentricity = sqrt(_eccentricity2);
    }
    return self;
}

-(instancetype) initWithType: (enum PROJEllipsoidType) type andShortName: (NSString *) shortName andEquatorRadius: (double) equatorRadius andEccentricity2: (double) eccentricity2 andNames: (NSArray<NSString *> *) names{
    self = [super init];
    if(self != nil){
        _type = type;
        _shortName = shortName;
        _names = names;
        _equatorRadius = equatorRadius;
        [self setEccentricitySquared:eccentricity2];
    }
    return self;
}

-(enum PROJEllipsoidType) type{
    return _type;
}

-(NSString *) name{
    return [_names firstObject];
}

-(NSArray<NSString *> *) names{
    return _names;
}

-(NSString *) shortName{
    return _shortName;
}

-(double) equatorRadius{
    return _equatorRadius;
}

-(double) a{
    return _equatorRadius;
}

-(double) b{
    return _poleRadius;
}

-(void) setEccentricitySquared: (double) eccentricity2{
    _eccentricity2 = eccentricity2;
    _poleRadius = _equatorRadius * sqrt(1.0 - eccentricity2);
    _eccentricity = sqrt(eccentricity2);
}

-(double) eccentricitySquared{
    return _eccentricity2;
}

-(BOOL) isEqualToEllipsoid: (PROJEllipsoid *) ellipsoid{
    return _equatorRadius == ellipsoid.equatorRadius && _eccentricity2 == ellipsoid.eccentricity2;
}

-(BOOL) isEqualToEllipsoid: (PROJEllipsoid *) ellipsoid withTolerance: (double) e2Tolerance{
    if(_equatorRadius != ellipsoid.equatorRadius) return NO;
    if (fabs(_eccentricity2
            - ellipsoid.eccentricity2) > e2Tolerance) return NO;
    return YES;
}

-(NSString *) description{
    return [self name];
}

-(BOOL) isEqual: (id) object{
    if(self == object){
        return YES;
    }
    
    if(![object isKindOfClass:[PROJEllipsoid class]]){
        return NO;
    }
    
    PROJEllipsoid *ellipsoid = (PROJEllipsoid *) object;
    if(_names == nil){
        if(ellipsoid.names != nil)
            return NO;
    }else if(![_names isEqual:ellipsoid.names])
        return NO;
    if(_shortName == nil){
        if (ellipsoid.shortName != nil)
            return NO;
    }else if(![_shortName isEqualToString:ellipsoid.shortName])
        return NO;
    
    return _equatorRadius == ellipsoid.equatorRadius
        && _poleRadius == ellipsoid.poleRadius
        && _eccentricity == ellipsoid.eccentricity;
}

-(NSUInteger) hash{
    return [_names hash]
            | (7 * [_shortName hash])
            | (17 * [[NSNumber numberWithDouble:_equatorRadius] hash])
            | (29 * [[NSNumber numberWithDouble:_poleRadius] hash])
            | (37 * [[NSNumber numberWithDouble:_eccentricity] hash]);
}


@end
