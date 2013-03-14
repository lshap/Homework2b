//
//  LMSMapViewController.h
//  Homework2b
//
//  Created by Lauren Shapiro on 3/13/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//
#import<MapKit/MapKit.h>
#import<MapKit/MKAnnotation.h>
#import <UIKit/UIKit.h>

@interface LMSMapViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager* maplocationmanager;
@property (strong, nonatomic) MKPointAnnotation* point;
-(void) setMapLocation:(CLLocation*) maplocation;
-(void)setPoint:(MKPointAnnotation *)pointann;
@end
