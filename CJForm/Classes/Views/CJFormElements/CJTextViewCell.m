//
//  CJTextViewCell.m
//  CJForm
//
//  Created by Jeremy on 10/04/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJTextViewCell.h"

#import "GCPlaceholderTextView.h"

@implementation CJTextViewCell

@synthesize textView = _textView;

- (id)init {
    self = [super init];
    if (self) {
        self.textLabel.textAlignment = UITextAlignmentCenter;
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        _textView = [[GCPlaceholderTextView alloc] initWithFrame:self.contentView.frame];
        _textView.font = [UIFont systemFontOfSize:self.textLabel.font.pointSize];
        _textView.placeholderColor = placeholderColor;

        [self.contentView addSubview:_textView];
    }
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder {
    [super setPlaceholder:placeholder];
    _textView.placeholder = self.placeholder;
}

- (NSString*)value {
    return _textView.text;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];

    frame.size.height -= 1;
    frame.origin = CGPointZero;

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        frame.size.width -= 20;
    }
    else {
        frame.size.width -= 90;
    }

    _textView.frame =  frame;
}

@end
