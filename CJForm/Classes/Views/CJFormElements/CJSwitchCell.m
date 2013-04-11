//
//  CJSwitch.m
//  CJForm
//
//  Created by Jeremy Chaufourier on 22/03/13.
//  Copyright (c) 2013 opsone. All rights reserved.
//

#import "CJSwitchCell.h"

@implementation CJSwitchCell

@synthesize toogle = _toogle;

- (id)init {
    self = [super init];
    if (self) {
        _toogle = [[UISwitch alloc] init];
    
        [self.contentView addSubview:_toogle];
    }
    return self;
}

- (void)setLabel:(NSString *)label {
    [super setLabel:label];
    self.textLabel.text = label;
}

- (NSString*)label {
    return self.textLabel.text;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect frame = self.contentView.frame;

    self.textLabel.frame = CGRectMake(self.textLabel.frame.origin.x, 0, CGRectGetWidth(frame) - CGRectGetWidth(_toogle.frame) - 15, CGRectGetHeight(frame));

    frame.origin.x = frame.size.width - 84;
    frame.origin.y = 8;
    _toogle.frame = frame;
}

@end
