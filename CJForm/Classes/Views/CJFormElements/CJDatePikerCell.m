//
//  CJDatePikerCell.m
//  CJForm
//
//  Created by Jeremy Chaufourier on 30/08/12.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJDatePikerCell.h"

@implementation CJDatePikerCell

@synthesize date = _date;

- (id)init {
    self = [super init];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (NSString*)value {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [formatter stringFromDate:_date];
}

- (void)setLabel:(NSString *)label {
    self.textLabel.text = [label capitalizedString];
    self.textLabel.font = [UIFont systemFontOfSize:self.textLabel.font.pointSize];
    self.textLabel.textColor = [UIColor blackColor];
}

- (void)setPlaceholder:(NSString *)placeholder {
    [super setPlaceholder:placeholder];
    self.textLabel.text = self.placeholder;
    self.textLabel.font = [UIFont systemFontOfSize:self.textLabel.font.pointSize];
}

- (void)setDate:(NSDate *)date {
    _date = date;

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [formatter setDateStyle:NSDateFormatterFullStyle];

    self.label = [formatter stringFromDate:date];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect frame = self.contentView.frame;

    self.textLabel.frame = CGRectMake(self.textLabel.frame.origin.x, 0, CGRectGetWidth(frame) - 20, CGRectGetHeight(frame));
}

@end
