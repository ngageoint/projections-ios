//
//  PROJIOUtils.h
//  proj-ios
//
//  Created by Brian Osborn on 5/3/18.
//  Copyright © 2018 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PROJIOUtils : NSObject

/**
 *  Get the path of the property list file with name
 *
 *  @param name plist base file name
 *
 *  @return property list file path
 */
+(NSString *) propertyListPathWithName: (NSString *) name;

/**
 *  Get the path of the resource file with name and file type
 *
 *  @param name file name
 *  @param type extension type
 *
 *  @return file resource path
 */
+(NSString *) resourcePathWithName: (NSString *) name andType: (NSString *) type;

@end
