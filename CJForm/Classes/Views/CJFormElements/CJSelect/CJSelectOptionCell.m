//
//  CJSelectOptionCell.m
//  CJForm
//
//  Created by Jeremy Chaufourier on 02/09/12.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJSelectOptionCell.h"

@implementation CJSelectOptionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textColor = [UIColor blackColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];

        UIColor *color = [UIColor redColor];

        CGRect frame = CGRectMake(self.frame.size.width - 30, 14, 20, 18);
        UILabel *arrow = [[UILabel alloc] initWithFrame:frame];
        arrow.font = [UIFont fontWithName:@"GillSans-Bold" size:25];
        arrow.textColor = color;
        arrow.backgroundColor = [UIColor clearColor];
        arrow.text = @"✓";

        [self setAccessoryView:arrow];
        self.accessoryView.hidden = YES;
    }
    return self;
}

@end
