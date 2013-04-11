//
//  CJTextFieldCell.h
//  CJForm
//
//  Created by Jeremy Chaufourier on 30/08/12.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CJFormElementCell.h"

@interface CJTextFieldCell : CJFormElementCell {
    float ratio;
}

@property (readonly) UITextField *textField;

@end
