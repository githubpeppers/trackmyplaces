//
//  SSJPlaceDetailsViewController.h
//  TrackMyPlaces
//
//  Created by sachin jamthe on 1/4/14.
//  Copyright (c) 2014 peppers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSJPlaceDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *placeLabel;

@property (nonatomic, strong) NSString *placeDetails;

@end
