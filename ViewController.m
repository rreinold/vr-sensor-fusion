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

@synthesize username,usernameLabel, password, passwordLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //    [self.loginBorder.layer setCornerRadius:5.0]; //reference
    SEL aSelector = @selector(transparentLabels);
    username.alpha=0.88;
    password.alpha = 0.88;
    password.borderStyle = UITextBorderStyleRoundedRect;
    username.borderStyle = UITextBorderStyleRoundedRect;
    
    //password.backgroundColor = [UIColor grayColor];
    //password.backgroundColor = [UIColor grayColor];
    //loginBorder.layer.cornerRadius = 10.0;

}

- (IBAction)aSelector:(id)sender{
    usernameLabel.alpha=0.03;
    passwordLabel.alpha=0.03;
    [sender resignFirstResponder];
}

- (void)transparentLabels{
    usernameLabel.alpha=0;
    passwordLabel.alpha=0;
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
    if(username.hasText == FALSE){usernameLabel.alpha=1;passwordLabel.alpha=1;}
    [sender resignFirstResponder];
}
@end
