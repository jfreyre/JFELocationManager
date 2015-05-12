//
//  JFELocationManager.h
//  Wind Dongle
//
//  Created by Jérome Freyre on 21.08.13.
//  Copyright (c) 2013 JDC. All rights reserved.
//

#import "JFELocationManager.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)


@implementation JFELocationManager

static JFELocationManager *sharedInstance;

+ (JFELocationManager *)sharedInstance {
    static dispatch_once_t onceToken = 0;

    __strong static id _sharedObject = nil;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+(id)alloc {
    @synchronized(self) {
        NSAssert(sharedInstance == nil, @"Attempted to allocate a second instance of a singleton LocationController.");
        sharedInstance = [super alloc];
    }
    return sharedInstance;
}

-(id) init {
    if (self = [super init]) {
        self.currentLocation = [[CLLocation alloc] init];
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;

        [_locationManager setDistanceFilter:kCLDistanceFilterNone];
        [_locationManager setDistanceFilter:1.f];
        [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];

        if ([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_locationManager requestAlwaysAuthorization];
            });

        }
        [self start];
    }
    return self;
}

+ (void) releaseSharedInstance {
    sharedInstance = nil;
}

+ (BOOL) checkStatus {
    BOOL location_is_available = [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized;
    if (!location_is_available) {
        UIAlertView * av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Erreur",  @"JFELocationManager") message:NSLocalizedString(@"This application needs an access to your location.",  @"JFELocationManager") delegate:nil cancelButtonTitle:NSLocalizedString(@"OK",  @"JFELocationManager") otherButtonTitles: nil];
        [av show];
    }
    return location_is_available;
}


-(void) start {
    [_locationManager startUpdatingLocation];
    [_locationManager startUpdatingHeading];
}

-(void) stop {
    [_locationManager stopUpdatingLocation];
    [_locationManager stopUpdatingHeading];
}

-(BOOL) locationKnown {
    return (round(_currentLocation.speed) == -1);
}

#pragma mark
#pragma mark CLLocationDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    [self locationManager:manager didUpdateLocations:[NSArray arrayWithObject:newLocation]];

}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (_delegate != nil && [_delegate respondsToSelector:@selector(didChangeAuthorizationStatus:)]) {
        [_delegate didChangeAuthorizationStatus:status];
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {

    _currentLocation = [locations lastObject];
    NSLog(@"JFELocationManager -> did update location (%f;%f)", _currentLocation.coordinate.latitude, _currentLocation.coordinate.longitude);

    if (_delegate != nil && [_delegate respondsToSelector:@selector(didUpdateLocation:)]) {
        [_delegate didUpdateLocation:_currentLocation];
    }

    if (_importantDelegate != nil && [_importantDelegate respondsToSelector:@selector(didUpdateLocation:)]) {
        [_importantDelegate didUpdateLocation:_currentLocation];
    }

}
-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    _currentHeading = newHeading;
    //    double rotation = newHeading.magneticHeading * 3.14159 / 180;
    //    NSLog(@"MMLocationManager -> New rotation: %f", rotation);
    if (_delegate != nil && [_delegate respondsToSelector:@selector(didUpdateHeading:)]) {
        [_delegate didUpdateHeading:_currentHeading];
    }
    if (_importantDelegate != nil && [_importantDelegate respondsToSelector:@selector(didUpdateHeading:)]) {
        [_importantDelegate didUpdateHeading:_currentHeading];
    }

}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {

}




@end