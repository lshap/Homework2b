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
@property (weak, nonatomic) IBOutlet UILabel *descriptionText;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) NSString* titletext;
@property (strong, nonatomic) NSString* descriptionlabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocation* location;

-(void) setLabel:(NSString*)newlbl;
-(void) setTitleText:(NSString*)newtitle;
-(void) setViewLocation:(CLLocation*)currentlocation;

@end
