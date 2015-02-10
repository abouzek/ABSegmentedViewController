//
//  ABAppDelegate.m
//  ABSegmentedViewController
//
//  Created by CocoaPods on 02/10/2015.
//  Copyright (c) 2014 abouzek. All rights reserved.
//

#import "ABAppDelegate.h"
#import "ABViewController.h"
#import <ABSegmentedViewController/ABSegmentedViewController.h>

@implementation ABAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [self exampleSegmentedViewController];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(ABSegmentedViewController *)exampleSegmentedViewController {
    ABViewController *firstViewController = [[ABViewController alloc] initWithTitle:@"FIRST"];
    ABViewController *secondViewController = [[ABViewController alloc] initWithTitle:@"SECOND"];
    
    UIFont *font = [UIFont fontWithName:@"AvenirNext-Bold" size:16];
    NSNumber *kern = @3;
    NSDictionary *deselectedTextAttributes = @{NSForegroundColorAttributeName:[[UIColor whiteColor] colorWithAlphaComponent:0.5],
                                                NSFontAttributeName:font, NSKernAttributeName:kern};
    NSDictionary *selectedTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                              NSFontAttributeName:font, NSKernAttributeName:kern};
    UIColor *selectedBackgroundColor = [UIColor colorWithRed:39/255.0 green:82/255.0 blue:102/255.0 alpha:1];
    UIColor *deselectedBackgroundColor = [UIColor colorWithRed:25/255.0 green:52/255.0 blue:65/255.0 alpha:1];
    
    ABSegmentedViewController *segmentedViewController = [ABSegmentedViewController segmentedContainerViewControllerWithViewControllers:@[firstViewController, secondViewController]
                                                                                                                 selectedTextAttributes:selectedTextAttributes
                                                                                                               deselectedTextAttributes:deselectedTextAttributes
                                                                                                                selectedBackgroundColor:selectedBackgroundColor
                                                                                                              deselectedBackgroundColor:deselectedBackgroundColor];
    return segmentedViewController;
}


@end
