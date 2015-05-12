//
//  JFEAppDelegate.m
//  JFELocationManager
//
//  Created by CocoaPods on 05/12/2015.
//  Copyright (c) 2014 Jerome Freyre. All rights reserved.
//

#import "JFEAppDelegate.h"
#import "JFELocationManager.h"

@implementation JFEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Will initiate the location manager
    [JFELocationManager sharedInstance];
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Force to disable the location update only if there is no "important delegate"
    if ([JFELocationManager sharedInstance].importantDelegate == nil) {
        NSLog(@"AppDelegate -> I disable updating location");
        [[JFELocationManager sharedInstance] stop];
    }
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    if ([JFELocationManager sharedInstance].importantDelegate == nil) {
        [[JFELocationManager sharedInstance] start];
        NSLog(@"AppDelegate -> I enable updating location");
    }
}


@end
