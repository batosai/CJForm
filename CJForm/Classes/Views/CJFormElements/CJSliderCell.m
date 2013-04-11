//
//  CJSliderCell.m
//  CJForm
//
//  Created by Jeremy Chaufourier on 12/09/12.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJSliderCell.h"

#define kPADDING 15

@implementation CJSliderCell

@synthesize slider = _slider;

- (id)init {
    self = [super init];
    if (self) {
        ratio = [[UILabel alloc] init];
        ratio.text = @"0%";
        ratio.backgroundColor = [UIColor clearColor];
        ratio.font = [UIFont systemFontOfSize:12];
        ratio.textAlignment = UITextAlignmentRight;

         _slider = [[UISlider alloc] init];
         [_slider addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventValueChanged];
         _slider.value = .0;

        [self addSubview:_slider];
        [self addSubview:ratio];
    }
    return self;
}

- (void)setValue:(NSString *)value {
    [super setValue:value];
    _slider.value = [value floatValue];
    ratio.text = [NSString stringWithFormat:@"%@%%", value];
}

- (void)sliderAction {
    self.value = [NSString stringWithFormat:@"%i", (int) ceil([_slider value] / 10) *10];
    ratio.text = [NSString stringWithFormat:@"%@%%", self.value];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect frame = self.contentView.frame;

    CGRect ratioFrame = CGRectMake(0, 0, 35, CGRectGetHeight(frame));
    CGRect sliderFrame = CGRectMake(0, 0, 150, 4);

    self.textLabel.frame = CGRectMake(self.textLabel.frame.origin.x, 0, CGRectGetWidth(frame) - CGRectGetWidth(ratioFrame) - CGRectGetWidth(sliderFrame) - kPADDING, CGRectGetHeight(frame));

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        ratioFrame.origin = CGPointMake(frame.size.width, 0);
        sliderFrame.origin = CGPointMake(frame.size.width - CGRectGetWidth(sliderFrame), 22);
    }
    else {
        ratioFrame.origin = CGPointMake(frame.size.width - CGRectGetWidth(ratioFrame), 0);
        sliderFrame.origin = CGPointMake(frame.size.width - CGRectGetWidth(sliderFrame) - CGRectGetWidth(ratioFrame), 22);
    }

    ratio.frame = ratioFrame;
    _slider.frame = sliderFrame;
}

@end
