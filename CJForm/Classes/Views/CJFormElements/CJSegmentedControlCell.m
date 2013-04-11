//
//  CJSegmentedControlCell.m
//  CJForm
//
//  Created by Jeremy on 11/04/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJSegmentedControlCell.h"
#import "NSString+CJStringValidator.h"

@implementation CJSegmentedControlCell

@synthesize
    segmentedControl= _segmentedControl,
    items           = _items
;

- (void)setItems:(NSArray *)items {
    _items = items;

    _segmentedControl = [[UISegmentedControl alloc] initWithItems:items];

    [_segmentedControl addTarget:self
                          action:@selector(segmentedControl:)
                forControlEvents:UIControlEventAllEvents];

    [self addSubview:_segmentedControl];
}

- (void)setValue:(NSString *)value {
    [super setValue:value];

    if ([value isDigit]) {
        _segmentedControl.selectedSegmentIndex = [value integerValue];
    }
    else {
        _segmentedControl.selectedSegmentIndex = [_items indexOfObject:value];
    }    
}

- (void)layoutSubviews {
    [super layoutSubviews];

    float margin = 0.;

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        margin = 70;
    }

    _segmentedControl.frame = CGRectMake(10 + (margin/2), 0, CGRectGetWidth(self.frame) - 20 - margin, CGRectGetHeight(self.frame));
}

#pragma action

- (void)segmentedControl:(UISegmentedControl *)control {
    self.value = [NSString stringWithFormat:@"%i", control.selectedSegmentIndex];
}

@end
