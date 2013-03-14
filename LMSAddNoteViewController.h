//
//  LMSAddNoteViewController.h
//  Homework2b
//
//  Created by Lauren Shapiro on 3/11/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMSAddNoteViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *addTitleLabel;
@property (weak, nonatomic) IBOutlet UITextField *addDescriptionLabel;
@end
