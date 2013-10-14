//
//  JFEViewController.m
//  DemoProject
//
//  Created by Jérome Freyre on 14.10.13.
//  Copyright (c) 2013 Jérome Freyre. All rights reserved.
//

#import "JFEViewController.h"

@interface JFEViewController ()

@end

@implementation JFEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[JFELocationManager sharedInstance] setDelegate:self];
    
    // Force to update label
    [self didUpdateLocation:[[JFELocationManager sharedInstance] currentLocation]];
    [self didUpdateHeading:[[JFELocationManager sharedInstance] currentHeading]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
-(IBAction) changeDelegateType:(UISegmentedControl*)sender
{
    
    if (sender.selectedSegmentIndex == 0) {
        [[JFELocationManager sharedInstance] setDelegate:self];
        [[JFELocationManager sharedInstance] setImportantDelegate:nil];
    } else if (sender.selectedSegmentIndex == 1) {
        [[JFELocationManager sharedInstance] setDelegate:nil];
        [[JFELocationManager sharedInstance] setImportantDelegate:self];
    }
}


#pragma mark - JFELocationManagerDelegate
-(void)didUpdateHeading:(CLHeading *)newHeading
{
    double currentHeading = -newHeading.trueHeading * M_PI / 180;
    [_headingLbl setText:[NSString stringWithFormat:@"%0.1f°", currentHeading]];
}


-(void) didUpdateLocation:(CLLocation *)location
{
    [_locationLbl setText:[NSString stringWithFormat:@"Lat: %.2f\nLon: %.2f", location.coordinate.latitude, location.coordinate.longitude]];
    
}
@end
