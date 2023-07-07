//
//  PROJProjectionFactoryTypes.h
//  proj-ios
//
//  Created by Brian Osborn on 8/19/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Well-known text representation of coordinate reference systems category type
 */
enum PROJProjectionFactoryType{
    /**
     * Cached projections from previous retrievals
     */
    PROJ_FACTORY_CACHE,
    
    /**
     * Well-Known Text Definition parsing and proj4 conversion
     */
    PROJ_FACTORY_DEFINITION,
    
    /**
     * proj4 creation from proj4 projection parameters
     */
    PROJ_FACTORY_PARAMETERS,
    
    /**
     * Creation from project and custom properties of configured proj4 projection parameters
     */
    PROJ_FACTORY_PROPERTIES
    
};

@interface PROJProjectionFactoryTypes : NSObject

@end
