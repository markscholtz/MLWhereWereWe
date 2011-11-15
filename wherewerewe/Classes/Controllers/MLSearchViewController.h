//
//  MLSearchViewController.h
//  wherewerewe
//
//  Created by Mark Scholtz on 2011/11/15.
//  Copyright (c) 2011 Unboxed Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLSearchViewController : UIViewController <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UISearchBar *searchBar;
    IBOutlet UITableView *tableView;
}

@end
