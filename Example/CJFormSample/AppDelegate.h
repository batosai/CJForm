//
//  AppDelegate.h
//  CJForm
//
//  Created by Jeremy on 27/02/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FormViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    FormViewController *rootViewController;
}

@property (strong, nonatomic) UIWindow *window;

@end
