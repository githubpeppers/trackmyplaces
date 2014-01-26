//
//  SSJPlaceDetailsViewController.m
//  TrackMyPlaces
//
//  Created by sachin jamthe on 1/4/14.
//  Copyright (c) 2014 peppers. All rights reserved.
//

#import "SSJPlaceDetailsViewController.h"

@interface SSJPlaceDetailsViewController ()

@end

@implementation SSJPlaceDetailsViewController

@synthesize placeDetails;
@synthesize placeLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    placeLabel.text = placeDetails;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
