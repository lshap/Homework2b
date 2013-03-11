//
//  LMSTableViewController.h
//  Homework2b
//
//  Created by Lauren Shapiro on 3/10/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface LMSTableViewController : UITableViewController
@property (strong, nonatomic) CLLocationManager *locationManager;
@end
