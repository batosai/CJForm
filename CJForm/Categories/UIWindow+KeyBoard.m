//
//  UIWindow+UIWindow_KeyBoard.m
//  CJForm
//
//  Created by Jeremy on 08/04/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "UIWindow+KeyBoard.h"

@implementation UIWindow (KeyBoard)

+ (BOOL)isKeyBoardInDisplay {

    BOOL isExists = NO;
    for (UIWindow *keyboardWindow in [[UIApplication sharedApplication] windows])   {
        if ([[keyboardWindow description] hasPrefix:@"<UITextEffectsWindow"] == YES) {
            isExists = YES;
        }
    }

    return isExists;
}

@end
