//
//  SSJEditTableViewController.h
//  TrackMyPlaces
//
//  Created by sachin jamthe on 1/1/14.
//  Copyright (c) 2014 peppers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSJEditTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *myArray ;
    NSMutableDictionary *details;
    
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableViewOut;
@property NSString *latitude;
@property NSString *longitude;
@end
