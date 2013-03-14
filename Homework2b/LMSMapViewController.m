//
//  LMSMapViewController.m
//  Homework2b
//
//  Created by Lauren Shapiro on 3/13/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import "LMSMapViewController.h"

@interface LMSMapViewController ()

@end

@implementation LMSMapViewController

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
    self.maplocationmanager = [[CLLocationManager alloc]init];
    self.maplocationmanager.delegate = self;
    
    CLLocationCoordinate2D coord;
    coord.latitude = 45.733333;
    coord.longitude = 9.133333;
    
   MKPointAnnotation* pin = [[MKPointAnnotation alloc]init];
//    pin.coordinate = CLLocationCoordinate2DMake(40, -122);
    pin.coordinate = coord;
    [self.mapView addAnnotation: pin];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(pin.coordinate,5, 5);
    [self.mapView setRegion: region];
    [self.mapView setCenterCoordinate:pin.coordinate animated:YES];
}

-(void)setPoint:(MKPointAnnotation *)pointann
{
    self.point = pointann;
}


-(void)locationManager:(CLLocationManager*) manager didUpdateLocations:(NSArray*) locations
{
   
//    pin.coordinate = self.maplocationmanager.location.coordinate;

}

-(void) setMapLocation:(CLLocation*) maplocation
{
//    self.location = maplocation;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
