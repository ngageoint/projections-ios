//
//  PROJIOUtils.m
//  proj-ios
//
//  Created by Brian Osborn on 5/3/18.
//  Copyright © 2018 NGA. All rights reserved.
//

#import "PROJIOUtils.h"
#import "PROJConstants.h"

@implementation PROJIOUtils

+(NSString *) propertyListPathWithName: (NSString *) name{
    return [self resourcePathWithName:name andType:PROJ_PROPERTY_LIST_TYPE];
}

+(NSString *) databasePath{
    return [self resourcePathWithName:[NSString stringWithFormat:@"%@/%@", PROJ_BUNDLE_NAME, PROJ_DATABASE_NAME] andType:PROJ_DATABASE_TYPE];
}

+(NSString *) resourcePathWithName: (NSString *) name andType: (NSString *) type{
    
    NSString *resource = [NSString stringWithFormat:@"%@/%@", PROJ_IOS_BUNDLE_NAME, name];
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:resource ofType:type];
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

+(void) copyDatabase{

    NSString *databasePath = [self databasePath];
    NSString *databaseName = [databasePath lastPathComponent];

    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSString *currentPath = [fileManager currentDirectoryPath];
    NSString *databaseCopyPath = [currentPath stringByAppendingPathComponent:databaseName];

    [fileManager copyItemAtPath:databasePath toPath:databaseCopyPath error:nil];

}

@end
