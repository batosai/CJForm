//
//  CJFormElementCell.m
//  CJForm
//
//  Created by Jeremy Chaufourier on 01/09/12.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJFormElementCell.h"

@implementation CJFormElementCell

@synthesize placeholder = _placeholder,
            label = _label,
            name = _name,
            value = _value,
            require = _require;

- (id)init {
    return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifierForm"];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        placeholderColor = [UIColor colorWithRed:179/255. green:179/255. blue:179/255. alpha:1];

        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.font = [UIFont boldSystemFontOfSize:14];
        self.textLabel.textColor = [UIColor blackColor];
        self.backgroundColor = [UIColor whiteColor];

        _value = [NSString string];
        _require = NO;
    }
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder {
    self.textLabel.textColor = placeholderColor;
    _placeholder = [self isRequire] ? [NSString stringWithFormat:@"%@ *", placeholder] : placeholder;
}

- (void)setLabel:(NSString *)label {
    self.textLabel.text = [self isRequire] ? [NSString stringWithFormat:@"%@ *", label] : label;
}

- (BOOL)isValid {
    return block(self);
}

- (void)setValidator:(BOOL(^)(id element))callback {
    block = callback;
}

+ (CGFloat)heightForCell {
    return 45.;
}

@end