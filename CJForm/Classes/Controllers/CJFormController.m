//
//  CJFormController.m
//  CJForm
//
//  Created by Jeremy Chaufourier on 31/08/12.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJFormController.h"

@implementation CJFormController

@synthesize navigationController = _navigationController;

- (id)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                     target:self
                                                                     action:@selector(cancel)];

        saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                      target:self
                                                      action:@selector(save)];

        self.navigationItem.leftBarButtonItem = cancelButton;
        self.navigationItem.rightBarButtonItem = saveButton;

        self.tableView.backgroundView = nil; //ios6
        self.view.backgroundColor = [UIColor clearColor]; //ios5

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow) name:UIKeyboardDidShowNotification object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardDidHideNotification object:nil];
    }
    return self;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (!self.navigationController.datePickerView.hidden) {
        CGRect frameTableView = self.tableView.frame;
        frameTableView.size.height = [self heightTableViewForVisibleKeyBoard:NO];
        self.tableView.frame = frameTableView;
    }
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    if (!self.navigationController.datePickerView.hidden) {
        CGRect frameTableView = self.tableView.frame;
        frameTableView.size.height = [self heightTableViewForVisibleKeyBoard:YES];
        self.tableView.frame = frameTableView;
    }
}

#pragma Methodes

- (CJFormNavigationController *)navigationController {
    if (navigationController == nil) {
        navigationController = [[CJFormNavigationController alloc] initWithRootViewController:self];
        self.navigationController = navigationController;
    }

    return navigationController;
}

- (void)openDatePiker {
    
    if (!self.navigationController.datePickerView.hidden) {
        return;
    }

    [curanteTextField resignFirstResponder];
    [curanteTextView resignFirstResponder];

    CGRect frame = self.navigationController.datePickerView.frame;
    frame.origin.y += frame.size.height;

    self.navigationController.datePickerView.frame = frame;
    self.navigationController.datePickerView.hidden = NO;

    frame.origin.y -= frame.size.height;

    CGRect frameTableView = self.tableView.frame;
    frameTableView.size.height = [self heightTableViewForVisibleKeyBoard:YES];

    [UIView animateWithDuration:0.25 animations:^{
        self.navigationController.datePickerView.frame = frame;
    } completion:^ (BOOL finished) {
        if (finished) {
            self.tableView.frame = frameTableView;
        }
    }];

    saveDatePickerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];

    self.navigationItem.rightBarButtonItem = saveDatePickerButton;
}

#pragma Buttons Action

- (void)closeDatePiker {

    if (self.navigationController.datePickerView.hidden) {
        return;
    }

    CGRect frame = self.navigationController.datePickerView.frame;
    CGRect frameFinish = frame;

    frame.origin.y += frame.size.height;

    CGRect frameTableView = self.tableView.frame;
    frameTableView.size.height = [self heightTableViewForVisibleKeyBoard:NO];;
    self.tableView.frame = frameTableView;

    [UIView animateWithDuration:0.25 animations:^{
        self.navigationController.datePickerView.frame = frame;
    } completion:^ (BOOL finished) {
        if (finished) {
            self.navigationController.datePickerView.hidden = YES;
            self.navigationController.datePickerView.frame = frameFinish;
        }
    }];

    self.navigationItem.rightBarButtonItem = saveButton;
}

- (void)cancel {

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancelNoAnimated {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^(void) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (void)closeKeyboards {
    [self closeDatePiker];
    [curanteTextField resignFirstResponder];
    [curanteTextView resignFirstResponder];
}

#pragma Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    curanteTextField = textField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    curanteTextView = textView;
}

- (void)keyboardWillShow {
    [self closeDatePiker];
//    CGRect frameTableView = self.tableView.frame;
//    frameTableView.size.height = [self heightTableViewForVisibleKeyBoard:YES];
//
//    self.tableView.frame = frameTableView;
}

//- (void)keyboardWillHide {
//    CGRect frameTableView = self.tableView.frame;
//    frameTableView.size.height = [self heightTableViewForVisibleKeyBoard:NO];
//
//    self.tableView.frame = frameTableView;
//}

#pragma helpers

- (float)heightTableViewForVisibleKeyBoard:(BOOL)visible {
    if (visible) {
        return
            self.tableView.frame.size.height -
            self.navigationController.datePickerView.frame.size.height
        ;
    }
    else {
        return
            self.tableView.frame.size.height +
            self.navigationController.datePickerView.frame.size.height
        ;
    }
}

@end
