# JFELocationManager

[![CI Status](http://img.shields.io/travis/Jerome Freyre/JFELocationManager.svg?style=flat)](https://travis-ci.org/Jerome Freyre/JFELocationManager)
[![Version](https://img.shields.io/cocoapods/v/JFELocationManager.svg?style=flat)](http://cocoapods.org/pods/JFELocationManager)
[![License](https://img.shields.io/cocoapods/l/JFELocationManager.svg?style=flat)](http://cocoapods.org/pods/JFELocationManager)
[![Platform](https://img.shields.io/cocoapods/p/JFELocationManager.svg?style=flat)](http://cocoapods.org/pods/JFELocationManager)

It's a `CoreLocation wrapper` (singleton) to allow an internal use overall your application.

Call `[JFELocationManager sharedInstance];` in your AppDelegate file or somewhere else to initiate the singleton and automatically starting to update location and heading


### What about iOS 8 ?

JFELocationManager is now ready for iOS 8. To enable the library you have to add a new entry in you `Info.plist` file.

```
NSLocationAlwaysUsageDescription = "The message to be shown";
```

### Usage


Set a controller as
```objc
@interface JFEViewController : UIViewController<JFELocationManagerDelegate>
```

Then you can implement each (or one) of these delegate methods:

```objc
-(void) didUpdateHeading:(CLHeading *)newHeading;
-(void) didUpdateLocation:(CLLocation*) location;
-(void) didChangeAuthorizationStatus:(CLAuthorizationStatus)status;
```


To allow background updates you have to define those methods in your `appdelegate` file

```objc
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // ... Do something else ...
    // Force to disable the location update only if there is no "important delegate"
    if ([JFELocationManager sharedInstance].importantDelegate == nil) {
        NSLog(@"AppDelegate -> I disable updating location");
        [[JFELocationManager sharedInstance] stop];
    }

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // ... Do something else ...
    if ([JFELocationManager sharedInstance].importantDelegate == nil) {
        [[JFELocationManager sharedInstance] start];
        NSLog(@"AppDelegate -> I enable updating location");
    }
}
```

## Requirements

iOS 6.0 and later.

## Usage

Add `JFELocationManager.h/m` into your project, or `pod 'JFELocationManager'` using CocoaPods.


## Author

Jerome Freyre, jerome.freyre@gmail.com

## License

JFELocationManager is available under the MIT license. See the LICENSE file for more info.
