//
//  PROJIOUtils.m
//  proj-ios
//
//  Created by Brian Osborn on 5/3/18.
//  Copyright © 2018 NGA. All rights reserved.
//

#import <Projections/PROJIOUtils.h>
#import <Projections/PROJConstants.h>

@implementation PROJIOUtils

+(NSString *) propertyListPathWithName: (NSString *) name{
    return [self resourcePathWithName:name andType:PROJ_PROPERTY_LIST_TYPE];
}

+(NSString *) databasePath {
    NSString *path = [self resourcePathWithName:PROJ_DATABASE_NAME andType:PROJ_DATABASE_TYPE];
    return path;
}

+(NSString *) resourcePathWithName: (NSString *) name andType: (NSString *) type{
   
//    NSString *resource = [NSString stringWithFormat:@"%@/%@", PROJ_IOS_BUNDLE_NAME, name];
    
    // FIXME: Test this in an app to see if it works properly, then just use name if that's true. We're not loading from the proj.bundle anymore (Remove that reference)
    NSString *resource = name;
    
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:resource ofType:type];
    
    if (!resourcePath) {
        resourcePath = [SWIFTPM_MODULE_BUNDLE pathForResource:resource ofType:type];
    }
    
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
