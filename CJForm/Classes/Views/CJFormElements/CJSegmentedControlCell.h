//
//  CJSegmentedControlCell.h
//  CJFormSample
//
//  Created by Jeremy on 11/04/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJFormElementCell.h"

@interface CJSegmentedControlCell : CJFormElementCell

@property (readonly) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) NSArray *items;

@end
