//
//  CJSliderCell.h
//  CJForm
//
//  Created by Jeremy Chaufourier on 12/09/12.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJFormElementCell.h"

@interface CJSliderCell : CJFormElementCell {
    UILabel *ratio;
}

@property (readonly) UISlider *slider;

@end
