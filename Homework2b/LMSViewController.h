//
//  LMSViewController.h
//  Homework2b
//
//  Created by Lauren Shapiro on 3/10/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMSViewController: UIViewController
@property (weak, nonatomic) IBOutlet UINavigationBar *titleBar;
@property (weak, nonatomic) IBOutlet UILabel *descriptionText;
@property (strong, nonatomic) NSString* titletext;
@property (strong, nonatomic) NSString* descriptionlabel;
@property (nonatomic) BOOL isTitleSet;
@property (nonatomic) BOOL isDescriptionSet;
-(void) setLabel:(NSString*)newlbl;
@end
