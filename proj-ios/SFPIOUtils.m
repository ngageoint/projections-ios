//
//  SFPIOUtils.m
//  proj-ios
//
//  Created by Brian Osborn on 5/3/18.
//  Copyright © 2018 NGA. All rights reserved.
//

#import "SFPIOUtils.h"
#import "SFPConstants.h"

@implementation SFPIOUtils

+(NSString *) getPropertyListPathWithName: (NSString *) name{
    return [self getResourcePathWithName:name andType:SFP_PROPERTY_LIST_TYPE];
}

+(NSString *) getResourcePathWithName: (NSString *) name andType: (NSString *) type{
    
    NSString * resource = [NSString stringWithFormat:@"%@/%@", SFP_BUNDLE_NAME, name];
    NSString * resourcePath = [[NSBundle mainBundle] pathForResource:resource ofType:type];
    if(resourcePath == nil){
        resourcePath = [[NSBundle bundleForClass:[self class]] pathForResource:resource ofType:type];
        if(resourcePath == nil){
            resourcePath = [[NSBundle bundleForClass:[self class]] pathForResource:name ofType:type];
            if(resourcePath == nil){
                resourcePath = [[NSBundle mainBundle] pathForResource:name ofType:type];
            }
        }
    }
    if(resourcePath == nil){
        [NSException raise:@"Resource Not Found" format:@"Failed to find resource '%@' of type '%@'", name, type];
    }
    
    return resourcePath;
}

@end
