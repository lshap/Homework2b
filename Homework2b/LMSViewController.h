//
//  LMSViewController.h
//  Homework2b
//
//  Created by Lauren Shapiro on 3/10/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface LMSViewController: UIViewController
@property (weak, nonatomic) IBOutlet UINavigationBar *titleBar;
@property (weak, nonatomic) IBOutlet UILabel *descriptionText;
@property (strong, nonatomic) NSString* titletext;
@property (strong, nonatomic) NSString* descriptionlabel;
@property (nonatomic) BOOL isTitleSet;
@property (nonatomic) BOOL isDescriptionSet;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) CLLocation* location;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

-(void) setLabel:(NSString*)newlbl;

-(void) setViewLocation:(CLLocation*)currentlocation;

@end
