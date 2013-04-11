//
//  CJSelectCell.m
//  CJForm
//
//  Created by Jeremy Chaufourier on 31/08/12.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJSelectCell.h"

@implementation CJSelectCell

- (id)init {
    self = [super init];
    if (self) {
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    if (highlighted) {
        self.backgroundColor = [UIColor grayColor];
    }
    else {
        self.backgroundColor = [UIColor clearColor];
    }
}

- (void)setPlaceholder:(NSString *)placeholder {
    [super setPlaceholder:placeholder];
    self.textLabel.text = self.placeholder;
    self.textLabel.font = [UIFont systemFontOfSize:self.textLabel.font.pointSize];
}

- (void)setLabel:(NSString *)label {
    self.textLabel.text = label;
    self.textLabel.font = [UIFont systemFontOfSize:self.textLabel.font.pointSize];
    self.textLabel.textColor = [UIColor blackColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect frame = self.contentView.frame;

    self.textLabel.frame = CGRectMake(self.textLabel.frame.origin.x, 0, CGRectGetWidth(frame) - 20, CGRectGetHeight(frame));
}

@end
