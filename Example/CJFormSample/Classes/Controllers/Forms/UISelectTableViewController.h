//
//  UISelectTableViewController.h
//  CJForm
//
//  Created by Jeremy on 08/04/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UISelectViewDelegate
- (void)setValueSelect:(NSString*)string;
@end

@interface UISelectTableViewController : UITableViewController

@property (readwrite) id <UISelectViewDelegate> delegate;

@end
