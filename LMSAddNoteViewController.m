//
//  LMSAddNoteViewController.m
//  Homework2b
//
//  Created by Lauren Shapiro on 3/11/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import "LMSAddNoteViewController.h"

@interface LMSAddNoteViewController ()
@end

@implementation LMSAddNoteViewController

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
    _addTitleLabel.delegate = self;
    _addDescriptionLabel.delegate = self;
	
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_addDescriptionLabel resignFirstResponder];
    [_addTitleLabel resignFirstResponder];
    return NO;
}

-(void)dismissKeyboard {
    [_addDescriptionLabel resignFirstResponder];
    [_addTitleLabel resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
