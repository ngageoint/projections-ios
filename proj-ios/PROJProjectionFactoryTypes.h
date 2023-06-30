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
     * Well-Known Text Definition PROJ creation
     */
    PROJ_FACTORY_DEFINITION,

    /**
     * Well-Known Text Definition parameter parsing and PROJ parameter creation
     */
    PROJ_FACTORY_DEFINITION_PARAMETERS,

    /**
     * PROJ creation from a well-known coordinate reference system name
     */
    PROJ_FACTORY_NAME,

    /**
     * PROJ creation from PROJ projection parameters
     */
    PROJ_FACTORY_PARAMETERS,

    /**
     * Creation from project and custom properties of configured PROJ projection parameters
     */
    PROJ_FACTORY_PROPERTIES

};

@interface PROJProjectionFactoryTypes : NSObject

@end
