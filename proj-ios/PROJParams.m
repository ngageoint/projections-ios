//
//  PROJParams.m
//  proj-ios
//
//  Created by Brian Osborn on 8/24/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "PROJParams.h"

@implementation PROJParams

+(PROJParams *) params{
    return [[PROJParams alloc] init];
}

-(instancetype) init{
    self = [super init];
    return self;
}

-(NSString *) description{
    NSMutableString *description = [NSMutableString string];
    
    if(_proj != nil){
        [description appendFormat:@"+proj=%@", _proj];
    }
    if(_lat_1 != nil){
        [description appendFormat:@" +lat_1=%@", _lat_1];
    }
    if(_lat_2 != nil){
        [description appendFormat:@" +lat_2=%@", _lat_2];
    }
    if(_lat_0 != nil){
        [description appendFormat:@" +lat_0=%@", _lat_0];
    }
    if(_lon_0 != nil){
        [description appendFormat:@" +lon_0=%@", _lon_0];
    }
    if(_lonc != nil){
        [description appendFormat:@" +lonc=%@", _lonc];
    }
    if(_alpha != nil){
        [description appendFormat:@" +alpha=%@", _alpha];
    }
    if(_k_0 != nil){
        [description appendFormat:@" +k_0=%@", _k_0];
    }
    if(_x_0 != nil){
        [description appendFormat:@" +x_0=%@", _x_0];
    }
    if(_y_0 != nil){
        [description appendFormat:@" +y_0=%@", _y_0];
    }
    if(_axis != nil){
        [description appendFormat:@" +axis=%@", _axis];
    }
    if(_datum != nil){
        [description appendFormat:@" +datum=%@", _datum];
    }
    if(_no_uoff){
        [description appendFormat:@" +no_uoff"];
    }
    if(_gamma != nil){
        [description appendFormat:@" +gamma=%@", _gamma];
    }
    if(_zone != nil){
        [description appendFormat:@" +zone=%@", _zone];
    }
    if(_a != nil){
        [description appendFormat:@" +a=%@", _a];
    }
    if(_b != nil){
        [description appendFormat:@" +b=%@", _b];
    }
    if(_south){
        [description appendFormat:@" +south"];
    }
    if(_ellps != nil){
        [description appendFormat:@" +ellps=%@", _ellps];
    }
    if(_towgs84 != nil){
        [description appendFormat:@" +towgs84=%@", _towgs84];
    }else if(_param1 != nil || _param2 != nil || _param3 != nil || _param4 != nil || _param5 != nil || _param6 != nil || _param7 != nil){
        [description appendFormat:@" +towgs84=%@,%@,%@,%@,%@,%@,%@",
         _param1 != nil ? _param1 : @"0",
         _param2 != nil ? _param2 : @"0",
         _param3 != nil ? _param3 : @"0",
         _param4 != nil ? _param4 : @"0",
         _param5 != nil ? _param5 : @"0",
         _param6 != nil ? _param6 : @"0",
         _param7 != nil ? _param7 : @"0"];
    }
    if(_pm != nil){
        [description appendFormat:@" +pm=%@", _pm];
    }
    if(_units != nil){
        [description appendFormat:@" +units=%@", _units];
    }
    if(_no_defs){
        [description appendFormat:@" +no_defs"];
    }
    
    return description;
}


@end
