//
//  JFELocationManager.h
//  Wind Dongle
//
//  Created by Jérome Freyre on 21.08.13.
//  Copyright (c) 2013 JDC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol JFELocationManagerDelegate;

@interface JFELocationManager : NSObject<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, strong) CLHeading * currentHeading;

@property (nonatomic, strong) id<JFELocationManagerDelegate> delegate;
@property (nonatomic, strong) id<JFELocationManagerDelegate> importantDelegate;

+ (JFELocationManager *)sharedInstance;
+ (void) releaseSharedInstance;
+ (BOOL) checkStatus;

- (BOOL) locationKnown;

-(void) start;
-(void) stop;

@end

@protocol JFELocationManagerDelegate <NSObject>
@optional

-(void) didUpdateHeading:(CLHeading *)newHeading;
-(void) didUpdateLocation:(CLLocation*) location;
-(void) didChangeAuthorizationStatus:(CLAuthorizationStatus)status;
@end

