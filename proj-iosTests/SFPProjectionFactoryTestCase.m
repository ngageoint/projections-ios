//
//  SFPProjectionFactoryTestCase.m
//  sf-proj-ios
//
//  Created by Brian Osborn on 7/21/17.
//  Copyright © 2017 NGA. All rights reserved.
//

#import "SFPProjectionFactoryTestCase.h"
#import "SFPTestUtils.h"
#import "SFPProjectionConstants.h"
#import "SFPProjectionFactory.h"
#import "SFPProjectionRetriever.h"

@implementation SFPProjectionFactoryTestCase

static NSString *authority = @"Test";
static int code = 100001;

- (void)setUp {
    [super setUp];
    [SFPProjectionFactory clear];
    [SFPProjectionRetriever clear];
}

- (void)tearDown {
    [super tearDown];
}

-(void) testCustomProjection{
 
    NSNumber *authorityCode = [NSNumber numberWithInt:code];
    
    SFPProjection *projection = [SFPProjectionFactory projectionWithAuthority:authority
                                                                        andNumberCode:authorityCode
                                                                      andParams:@"+proj=tmerc +lat_0=0 +lon_0=121 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs"];
    authorityCode = [NSNumber numberWithInt:[authorityCode intValue] + 1];
    [SFPTestUtils assertNotNil:projection];
    
    @try{
        [SFPProjectionFactory projectionWithAuthority:authority
                            andNumberCode:authorityCode
                            andParams:@"+proj=tmerc +lat_0=0 +lon_0=121 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs +invalid"];
        [SFPTestUtils fail:@"Invalid projection did not fail"];
    } @catch (NSException *exception) {
        // pass
    }
    authorityCode = [NSNumber numberWithInt:[authorityCode intValue] + 1];
    
    @try {
        [SFPProjectionFactory projectionWithAuthority:authority andNumberCode:authorityCode];
        [SFPTestUtils fail:@"Invalid projection did not fail"];
    } @catch (NSException *exception) {
        // pass
    }
}

-(void) testAddingProjectionToAuthority{
    
    NSNumber *authorityCode = [NSNumber numberWithInt:code];
    
    @try {
        [SFPProjectionFactory projectionWithAuthority:PROJ_AUTHORITY_NONE andNumberCode:authorityCode];
        [SFPTestUtils fail:@"Missing projection did not fail"];
    } @catch (NSException *exception) {
        // pass
    }
    
    [SFPProjectionRetriever setProjection:@"+proj=tmerc +lat_0=0 +lon_0=121 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs"
                              forAuthority:PROJ_AUTHORITY_NONE andNumberCode:authorityCode];
    
    SFPProjection *projection = [SFPProjectionFactory projectionWithAuthority:PROJ_AUTHORITY_NONE andNumberCode:authorityCode];
    [SFPTestUtils assertNotNil:projection];
    
}

-(void) testAddingAuthorityProjections{
    
    // Make sure 4 projections do not exist
    for (int i = code; i < code + 4; i++) {
        @try {
            [SFPProjectionFactory projectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:i]];
            [SFPTestUtils fail:@"Missing projection did not fail"];
        } @catch (NSException *exception) {
            // pass
        }
    }
    
    // Add 3 custom projections to the new authority
    NSMutableDictionary *properties = [[NSMutableDictionary alloc] init];
    [properties setObject:@"+proj=tmerc +lat_0=0 +lon_0=121 +k=1 +x_0=500000 +y_0=0 +ellps=krass +units=m +no_defs"
                   forKey:[[NSNumber numberWithInt:code] stringValue]];
    [properties setObject:@"+proj=longlat +datum=WGS84 +no_defs"
                   forKey:[[NSNumber numberWithInt:code + 1] stringValue]];
    [properties setObject:@"+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs"
                   forKey:[[NSNumber numberWithInt:code + 2] stringValue]];
    [SFPProjectionRetriever setProjections:properties forAuthority:authority];
    
    // Verify first 3 projections exist, last still does not
    for (int i = code; i < code + 4; i++) {
        
        if (i < code + 3) {
            SFPProjection *projection = [SFPProjectionFactory projectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:i]];
            [SFPTestUtils assertNotNil:projection];
        } else {
            @try {
                [SFPProjectionFactory projectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:i]];
                [SFPTestUtils fail:@"Missing projection did not fail"];
            } @catch (NSException *exception) {
                // pass
            }
        }
    }
    
    // Clear authority code from retriever but not from factory cache
    [SFPProjectionRetriever clearAuthority:authority andNumberCode:[NSNumber numberWithInt:code]];
    SFPProjection *projection = [SFPProjectionFactory projectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code]];
    [SFPTestUtils assertNotNil:projection];
    
    // Clear authority code from factory cache and verify no longer exists
    [SFPProjectionFactory clearAuthority:authority andNumberCode:[NSNumber numberWithInt:code]];
    @try {
        [SFPProjectionFactory projectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code]];
        [SFPTestUtils fail:@"Missing projection did not fail"];
    } @catch (NSException *exception) {
        // pass
    }
    
    // Set projection back into the retriever and verify factory creates it
    [SFPProjectionRetriever setProjection:@"+proj=longlat +datum=WGS84 +no_defs"
                              forAuthority:authority andNumberCode:[NSNumber numberWithInt:code]];
    projection = [SFPProjectionFactory projectionWithAuthority:authority andNumberCode:[NSNumber numberWithInt:code]];
    [SFPTestUtils assertNotNil:projection];
}

@end
