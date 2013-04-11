//
//  formViewController.h
//  CJForm
//
//  Created by Jeremy on 03/04/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJFormController.h"
#import "CJForm.h"

@interface FormViewController : CJFormController {
    CJTextFieldCell         *firstnameCell;
    CJTextFieldCell         *lastnameCell;
    CJSwitchCell            *switchSSLCell;
    CJDatePikerCell         *dateCell;
    CJSliderCell            *sliderCell;
    CJSelectCell            *selectCell;
    CJTextViewCell          *textViewCell;
    CJSegmentedControlCell  *segmentedControlCell;
}

@end
