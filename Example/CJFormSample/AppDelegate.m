//
//  AppDelegate.m
//  CJForm
//
//  Created by Jeremy on 27/02/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "AppDelegate.h"

#import "FormViewController.h"

//#import "AccelerometreViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

//    AccelerometreViewController *test = [[AccelerometreViewController alloc] init];

    rootViewController = [[FormViewController alloc] init];
    self.window.rootViewController = rootViewController.navigationController;

//    self.window.rootViewController = test;

    return YES;
}

@end
