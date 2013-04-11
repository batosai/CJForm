//
//  CJFormNavigationController.m
//  CJForm
//
//  Created by Jeremy Chaufourier on 30/08/12.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJFormNavigationController.h"

@implementation CJFormNavigationController

@synthesize datePickerView = _datePickerView;

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationFormSheet;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self viewDatePiker];
}

- (void)viewDatePiker {
    if (_datePickerView == nil) {
        _datePickerView = [[UIDatePicker alloc] initWithFrame:CGRectZero];
        _datePickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        _datePickerView.datePickerMode = UIDatePickerModeDate;

        CGSize size = [_datePickerView sizeThatFits:CGSizeZero];
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGRect pickerRect = CGRectMake(	0.0,
                                       screenRect.size.height - size.height,
                                       screenRect.size.width,
                                       size.height);

        _datePickerView.frame = pickerRect;
    }

    _datePickerView.hidden = YES;
    [self.view addSubview:_datePickerView];
}

/* As of iOS 4.3, you can now implement a disablesAutomaticKeyboardDismissal and return NO */
- (BOOL)disablesAutomaticKeyboardDismissal {
    return NO;
}

@end
