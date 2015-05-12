//
//  JFEViewController.h
//  JFELocationManager
//
//  Created by Jerome Freyre on 05/12/2015.
//  Copyright (c) 2014 Jerome Freyre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFELocationManager.h"

@interface JFEViewController : UIViewController<JFELocationManagerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *headingLbl;
@property (strong, nonatomic) IBOutlet UILabel *locationLbl;


-(IBAction) changeDelegateType:(id)sender;

@end
