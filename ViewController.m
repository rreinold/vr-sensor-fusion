//
//  ViewController.m
//  VaprVideo_v1.0
//
//  Created by Robert Reinold on 5/28/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>//poss not needed

@interface ViewController ()

@end

@implementation ViewController

@synthesize username,password,loginBorder;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set up cornered, transparent border
    loginBorder.alpha = 0.5;
    //loginBorder.layer.cornerRadius = 10.0;
    [self.loginBorder.layer setCornerRadius:5.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Drop keyboard when background is touched
- (IBAction)backgroundTouched:(id)sender{
    [sender resignFirstResponder];
}
//Drop keyboard when return is pressed
- (IBAction)textFieldReturn:(id)sender{
    
    [sender resignFirstResponder];
}
@end
