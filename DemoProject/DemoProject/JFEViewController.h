//
//  JFEViewController.h
//  DemoProject
//
//  Created by Jérome Freyre on 14.10.13.
//  Copyright (c) 2013 Jérome Freyre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFELocationManager.h"

@interface JFEViewController : UIViewController<JFELocationManagerDelegate>


@property (strong, nonatomic) IBOutlet UILabel *headingLbl;
@property (strong, nonatomic) IBOutlet UILabel *locationLbl;


-(IBAction) changeDelegateType:(id)sender;
@end
