//
//  LMSAddNoteViewController.h
//  Homework2b
//
//  Created by Lauren Shapiro on 3/11/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMSAddNoteViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *addTitleLabel;
@property (strong, nonatomic) IBOutlet UITextField *addDescriptionLabel;

@end
