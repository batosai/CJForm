//
//  CJFormElementCell.h
//  CJForm
//
//  Created by Jeremy Chaufourier on 01/09/12.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef enum {
//    CJFormTypesText             = 1,
//    CJFormTypesUrl              = 2,
//    CJFormTypesSelect           = 3,
//    CJFormTypesSwitch           = 4,
//    CJFormTypesSegmented        = 5,
//    CJFormTypesDate             = 6,
//    CJFormTypesTextView         = 7,
//} CJFormTypes;

@interface CJFormElementCell : UITableViewCell {
    BOOL (^block)(id);
    UIColor *placeholderColor;
}

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) NSString *label;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *type;
@property (readwrite, getter=isRequire) BOOL require;
@property (readonly, getter=isValid) BOOL valid;

- (void)setValidator:(BOOL(^)(id))block;
+ (CGFloat)heightForCell;

@end