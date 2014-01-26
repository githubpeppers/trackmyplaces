//
//  SSJEditTableViewController.m
//  TrackMyPlaces
//
//  Created by sachin jamthe on 1/1/14.
//  Copyright (c) 2014 peppers. All rights reserved.
//

#import "SSJEditTableViewController.h"
#import "SSJPlaceDetailsViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface SSJEditTableViewController ()
{
   CLLocationManager *locationManager;
}

@end

@implementation SSJEditTableViewController
@synthesize tableViewOut;
@synthesize longitude;
@synthesize latitude;




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
	// Do any additional setup after loading the view.
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    [self.tableViewOut setHidden:YES];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickPlaces:(id)sender {
  
    
  //  self.tableViewOut.delegate = self;
  //  self.tableViewOut.dataSource = self;
    
  /*  myArray = [[NSMutableArray alloc] initWithObjects:@"one",@"two",@"three",@"four",@"five",@"one",@"two",@"three",@"four",@"five", nil];
    [self.tableViewOut setHidden:NO];
    [tableViewOut reloadData];*/
    
       [self setLocation];
       // NSLog(@"%@I am here", [locObject getLatitude]);
    
   //NSLog(@"%@I am here", [locObject longitude]);
    
    NSString *location = longitude;
    location = [location stringByAppendingString:@","];
    
    location = [location stringByAppendingString:latitude];
    
    NSString *urlString =@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=";
    
    urlString = [urlString stringByAppendingString:location];
    
    urlString = [urlString stringByAppendingString:@"&radius=5000&types=restaurant&sensor=false&key=AIzaSyD_zEB7SJrYRrAaq9rQKpjBHk7knfLN018"];
    
    //NSURL *myURL = [NSURL URLWithString:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&sensor=false&key=AIzaSyD_zEB7SJrYRrAaq9rQKpjBHk7knfLN018"];
    
    NSLog(@"%@",urlString);
    
    NSURL *myURL = [NSURL URLWithString:urlString];
    
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    
    NSURLConnection *myConnection = [NSURLConnection connectionWithRequest:myRequest delegate:self];
    
    
    // we'll receive raw data so we'll create an NSData Object with it
    NSData *myData = [[NSData alloc]initWithContentsOfURL:myURL];
    
    // now we'll parse our data using NSJSONSerialization
    id myJSON = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:nil];
    
    
    NSMutableDictionary *dictionary = (NSMutableDictionary *) myJSON;
    
    
    NSArray *results = dictionary[@"results"];
    
    //Allocate memory to array
    myArray = [[NSMutableArray alloc] init];
    
    self.tableViewOut.delegate = self;
    self.tableViewOut.dataSource = self;
    
    details = [[NSMutableDictionary alloc] init];
    
    
    for ( NSDictionary *theCourse in results )
    {
        //   NSLog(@"Name: %@", theCourse[@"name"] );
        
        NSString *part = theCourse[@"name"];
        part = [part stringByAppendingString:@" Address:"];
        
        part = [part stringByAppendingString:theCourse[@"vicinity"]];
        
        //NSLog(@"%@ ",part);
        //details = [NSDictionary dictionaryWithObjectsAndKeys:theCourse[@"name"],part, nil];
        [details setValue:part forKey:theCourse[@"name"]];
        [myArray addObject:theCourse[@"name"]];
        
    }
    
    //NSLog(@"%@",myArray);
    [self.tableViewOut setHidden:NO];
    [tableViewOut reloadData];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [myArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    // support line break mode
    
    cell.textLabel.numberOfLines=0;
    cell.textLabel.text = [myArray objectAtIndex:indexPath.row];
    return cell;
}
- (IBAction)clickHistory:(id)sender {
    
    self.tableViewOut.delegate = self;
    self.tableViewOut.dataSource = self;
    
    myArray = [[NSMutableArray alloc] initWithObjects:@"Historyone",@"Historytwo",@"Historythree",@"Historyfour",@"Historyfive",@"Historyone",@"Historytwo",@"Historythree",@"Historyfour",@"Historyfive", nil];
    [self.tableViewOut setHidden:NO];
    [tableViewOut reloadData];
}




- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*) response;
    
    int errorCode = httpResponse.statusCode;
    
    NSString *fileMIMEType = [[httpResponse MIMEType] lowercaseString];
    
   // NSLog(@"response is %d, %@", errorCode, fileMIMEType);
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
   // NSLog(@"data is %@", data);
    
    NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
  //  NSLog(@"string is %@", myString);

    
    
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    
    
    // inform the user
    
    NSLog(@"Connection failed! Error - %@ %@",
          
          [error localizedDescription],
          
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    // do something with the data
    
    // receivedData is declared as a method instance elsewhere
    
    NSLog(@"Succeeded!");
    
    
}

- (void)tableView:(UITableView *)tableViewOut didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"connectToDetail" sender:self];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([segue.identifier isEqualToString:@"connectToDetail"]) {
        NSIndexPath *indexPath = [self.tableViewOut indexPathForSelectedRow];
        NSString   *str = [myArray objectAtIndex:indexPath.row];
        
        for (NSString* key in [details allKeys]) {
            
            if ([key isEqualToString:str]) {
                SSJPlaceDetailsViewController *destViewController = segue.destinationViewController;
                destViewController.placeDetails = details[str];
            }
        }
        
        
        
        
    }
}



- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    latitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
    longitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    
    
    
    [locationManager stopUpdatingLocation];
    
}


-(void) setLocation{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];

}


@end
