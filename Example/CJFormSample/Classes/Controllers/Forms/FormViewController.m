//
//  formViewController.m
//  CJForm
//
//  Created by Jeremy on 03/04/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "FormViewController.h"

#import "UISelectTableViewController.h"

@interface FormViewController()<UISelectViewDelegate>

- (void)setValueSelect:(NSString*)string;

@end

@implementation FormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Form", nil);

        self.navigationController.navigationBar.clipsToBounds = YES; //disable shadow for ios6
#warning TODO TEST sans la barre, pb size conteneur.
//        self.navigationController.navigationBar.hidden = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 6) {
        return 120;
    }
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"CellIdentifier";
    
    if (indexPath.row == 0) {
        if (firstnameCell == nil)
        {
            firstnameCell = [[CJTextFieldCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                                   reuseIdentifier:cellIdentifier];
            
            firstnameCell.name = @"firstname";
            firstnameCell.require = YES;
            firstnameCell.textField.delegate = self;
            firstnameCell.placeholder = NSLocalizedString(@"FirstName", nil);
            [firstnameCell setValidator:^BOOL(CJTextFieldCell *element) {
                if (!element.value || [element.value isEmpty]) {
                    return NO;
                }
                else {
                    return YES;
                }
            }];
            
//            if (_dictionary) {
//                nameCell.label = [_dictionary objectForKey:nameCell.name];
//            }
        }

        return firstnameCell;
    }

    if (indexPath.row == 1) {
        if (lastnameCell == nil)
        {
            lastnameCell = [[CJTextFieldCell alloc] init];

            lastnameCell.name = @"lastname";
            lastnameCell.require = YES;
            lastnameCell.textField.delegate = self;
            lastnameCell.label = NSLocalizedString(@"LastName LastName", nil);
            [lastnameCell setValidator:^BOOL(CJTextFieldCell *element) {
                if (!element.value || [element.value isEmpty]) {
                    return NO;
                }
                else {
                    return YES;
                }
            }];

//            if (_dictionary) {
//                nameCell.label = [_dictionary objectForKey:nameCell.name];
//            }
        }

        return lastnameCell;
    }

    if (indexPath.row == 2) {
        if (switchSSLCell == nil)
        {
            switchSSLCell = [[CJSwitchCell alloc] init];

            switchSSLCell.name = @"switchSSL";
            switchSSLCell.label = NSLocalizedString(@"Use SSL certificate? Use SSL certificate?", nil);

            switchSSLCell.toogle.onTintColor = [UIColor redColor];
        }

        return switchSSLCell;
    }
    
    if (indexPath.row == 3) {
        if (dateCell == nil)
        {
            dateCell = [[CJDatePikerCell alloc] init];
            
            dateCell.name = @"date";
            dateCell.require = YES;
            dateCell.placeholder = NSLocalizedString(@"Date", nil);

//            if (_timeEntry) {
//                dateCell.date = _timeEntry.spentOn;
//            }
        }

        return dateCell;
    }
    
    if (indexPath.row == 4) {
        if (sliderCell == nil)
        {
            sliderCell = [[CJSliderCell alloc] init];
            
            sliderCell.name = @"slider";
            sliderCell.label = NSLocalizedString(@"Slider", nil);

            sliderCell.slider.minimumValue = 0.0;
            sliderCell.slider.maximumValue = 100.0;

//            if (_issue && _issue.doneRatio) {
//                doneRatiocell.value = [NSString stringWithFormat:@"%i", _issue.doneRatio];
//            }
        }
        
        return sliderCell;
    }

    if (indexPath.row == 5) {
        if (selectCell == nil)
        {
            selectCell = [[CJSelectCell alloc] init];

            selectCell.name = @"select";
            selectCell.placeholder = NSLocalizedString(@"Ma select", nil);
        }
        
        return selectCell;
    }

    if (indexPath.row == 6) {
        if (textViewCell == nil)
        {
            textViewCell = [[CJTextViewCell alloc] init];

            textViewCell.name = @"textView";
            textViewCell.placeholder = NSLocalizedString(@"TextView", nil);
            textViewCell.textView.delegate = self;
        }

        return textViewCell;
    }

    if (indexPath.row == 7) {
        if (segmentedControlCell == nil)
        {
            segmentedControlCell = [[CJSegmentedControlCell alloc] init];

            segmentedControlCell.name = @"segmendControl";
            segmentedControlCell.items = @[@"item1",@"item2",@"item3"];
            //segmentedControlCell.value = @"1";
            segmentedControlCell.value = @"item3";
        }

        return segmentedControlCell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 3) {
        if (dateCell.date) {
            self.navigationController.datePickerView.date = dateCell.date;
        }

        [self openDatePiker];
        saveDatePickerButton.action = @selector(saveDatePicker);
    }
    else if (indexPath.section == 0 && indexPath.row == 5) {
        UISelectTableViewController *selectController = [[UISelectTableViewController alloc] init];
        selectController.delegate = self;

        [self.navigationController pushViewController:selectController animated:YES];
    }
}

#pragma Delegate init

- (void)setValueSelect:(NSString*)string {
    selectCell.value = string;
    selectCell.label = string;
}

#pragma Actions

- (void)saveDatePicker {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
    dateCell.date = self.navigationController.datePickerView.date;
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self closeDatePiker];
}

- (void)save {
    if (firstnameCell.isValid) {
        NSLog(@"firstname is valid");
    }
    else {
        NSLog(@"firstname isn't valid");
    }
    
    NSLog(@"SAVE");
}

//iOS5

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

//iOS6 +

-(BOOL)shouldAutorotate {
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationLandscapeRight | UIInterfaceOrientationLandscapeLeft);
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeRight;
}

@end
