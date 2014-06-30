//
//  ViewController.h
//  VaprVideo_v1.0
//
//  Created by Robert Reinold on 5/28/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface ViewController : UIViewController{
    /*IBOutlet UILabel *XLabel;
    IBOutlet UILabel *YLabel;
    IBOutlet UILabel *ZLabel;*/
    //instantiate username, password field and transparent border
    IBOutlet UITextField *username;
    IBOutlet UITextField *password;
    IBOutlet UILabel *loginBorder;
    IBOutlet UIImageView *signUpIcon;
    
    
}
//Drop keyboard upon pressing enter
- (IBAction)textFieldReturn:(id)sender;
//Drop keyboard when background is touched
- (IBAction)backgroundTouched:(id)sender;
//pass username, password, and border to implementation
@property (nonatomic,retain) IBOutlet UITextField *username;
@property (nonatomic,retain) IBOutlet UITextField *password;
@property(nonatomic,retain)IBOutlet UILabel *loginBorder;

@end
