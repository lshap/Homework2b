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
    
    [self.mapView setDelegate: self];
}
-(void)viewDidAppear:(BOOL)animated
{
    [self addPinToMapAtLocation:self.location];

}
-(void) setTitleBar: (NSString*) newtitle
{
    if (!self.isTitleSet) {
        self.titletext= newtitle;
        self.isTitleSet = TRUE;
    }
}

- (void)addPinToMapAtLocation:(CLLocation *)location
{
    MKPointAnnotation* pin = [[MKPointAnnotation alloc]init];
    pin.coordinate = self.location.coordinate;
    [self.mapView addAnnotation:pin];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.location.coordinate, 1000, 1000);
    [self.mapView setRegion:region];
    [self.mapView setCenterCoordinate: pin.coordinate animated: YES];
    [self.mapView reloadInputViews];
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
