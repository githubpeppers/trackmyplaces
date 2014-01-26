//
//  SSJLoginViewController.m
//  TrackMyPlaces
//
//  Created by sachin jamthe on 1/9/14.
//  Copyright (c) 2014 peppers. All rights reserved.
//

#import "SSJLoginViewController.h"

@interface SSJLoginViewController ()

@end

@implementation SSJLoginViewController

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
    self.passwordField.secureTextEntry = YES;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginClicked:(id)sender {
    
    NSString *uname = self.unameString.text;
    
   NSUInteger strLen = [uname length];
    
    NSString *logstr = [NSString stringWithFormat:@"%i", strLen];
    
    NSLog(@"%@",logstr);
    
}

@end
