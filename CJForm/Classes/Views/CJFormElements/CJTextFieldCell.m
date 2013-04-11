//
//  CJTextFieldCell.m
//  CJForm
//
//  Created by Jeremy Chaufourier on 30/08/12.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJTextFieldCell.h"

#define kRATIO 0.35
#define kPADDING 15

@implementation CJTextFieldCell

@synthesize textField = _textField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        ratio = 0;

        _textField = [[UITextField alloc] init];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _textField.font = [UIFont systemFontOfSize:self.textLabel.font.pointSize];

        [self.contentView addSubview:_textField];
    }
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder {
    [super setPlaceholder:placeholder];
    _textField.placeholder = self.placeholder;
}

- (void)setLabel:(NSString *)label {
    [super setLabel:label];

    ratio = kRATIO;
    [self layoutIfNeeded];
}

- (NSString*)value {
    return _textField.text;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect frame = self.contentView.frame;
    frame.origin.x = 2;

    if (ratio) {
        frame.origin.x = CGRectGetWidth(frame) * kRATIO;
        frame.size.width -= CGRectGetWidth(frame) * kRATIO;
    }

    _textField.frame = frame;
    _textField.bounds = CGRectMake(kPADDING, 0, frame.size.width - kPADDING, frame.size.height);

    self.textLabel.frame = CGRectMake(self.textLabel.frame.origin.x, 0, _textField.frame.origin.x - kPADDING, CGRectGetHeight(_textField.frame));
    self.textLabel.backgroundColor = [UIColor clearColor];
}

@end
