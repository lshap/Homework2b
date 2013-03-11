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
}
-(void) setTitleBar: (NSString*)newtitle
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
