//
//  LMSViewController.m
//  Homework2b
//
//  Created by Lauren Shapiro on 3/10/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import "LMSViewController.h"

@interface LMSViewController ()
@end

@implementation LMSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleBar.topItem.title = self.titletext;
    self.descriptionText.text = self.descriptionlabel;
    
    _mapView = [[MKMapView alloc]init];
    
    MKPointAnnotation* pin = [[MKPointAnnotation alloc]init];
      pin.coordinate = self.location.coordinate;
      pin.title = self.titletext;
     [self.mapView addAnnotation:pin];
    
    MKCoordinateRegion region;
    region.center = pin.coordinate;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.10;
    span.longitudeDelta = 0.10;
    region.span = span;
    [self.mapView setRegion:region];
    
    [self.mapView setCenterCoordinate: pin.coordinate animated: YES];
    
}
-(void) setTitleBar: (NSString*) newtitle
{
    if (!self.isTitleSet) {
        self.titletext= newtitle;
        self.isTitleSet = TRUE;
    }
}

-(void) setLabel:(NSString*)newlbl
 {
     if (!self.isDescriptionSet)
     {
         self.descriptionlabel = newlbl;
     }
   }
-(void) setViewLocation: (CLLocation*) currentlocation
 {
    self.location = currentlocation;
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
