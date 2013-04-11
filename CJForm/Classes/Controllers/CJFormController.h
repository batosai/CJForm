//
//  CJFormController.h
//  CJForm
//
//  Created by Jeremy Chaufourier on 31/08/12.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CJFormNavigationController.h"
#import "CJForm.h"

@class CJButtonDeleteCell;

@interface CJFormController : UITableViewController<UITextFieldDelegate, UITextViewDelegate> {
    UITextField *curanteTextField;
    UITextView *curanteTextView;

    UIBarButtonItem *cancelButton;
    UIBarButtonItem *saveButton;
    UIBarButtonItem *saveDatePickerButton;
    
    CJFormNavigationController *navigationController;
}

@property (nonatomic, strong) CJFormNavigationController *navigationController;

- (void)openDatePiker;
- (void)closeDatePiker;
- (void)closeKeyboards;

@end