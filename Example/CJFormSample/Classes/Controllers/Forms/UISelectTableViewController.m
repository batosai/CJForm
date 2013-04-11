//
//  UISelectTableViewController.m
//  CJForm
//
//  Created by Jeremy on 08/04/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "UISelectTableViewController.h"

@interface UISelectTableViewController () {
    NSArray *booksArray;
}

@end

@implementation UISelectTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    booksArray = [NSArray arrayWithObjects:@"Brave new world",@"Call of the Wild",@"Catch-22",@"Atlas Shrugged",@"The Great Gatsby",@"The Art of War",@"The Catcher in the Rye",@"The Picture of Dorian Gray",@"The Grapes of Wrath", @"The Metamorphosis",nil];

    //[self.tableView setAllowsMultipleSelection:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return booksArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }

    // Configure the cell.
    cell.textLabel.text = [booksArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSArray *array = [tableView indexPathsForSelectedRows];
//    for (NSIndexPath *iPath in array) {
//        if (![iPath isEqual:indexPath]) {
//            [tableView deselectRowAtIndexPath:iPath animated:YES];
//            [self tableView:tableView didDeselectRowAtIndexPath:iPath];
//        }
//    }

    [self.delegate setValueSelect:booksArray[indexPath.row]];

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
}

@end
