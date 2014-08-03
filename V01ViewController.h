//
//  V01ViewController.h
//  VaprVideo_v1.0
//
//  Created by Robert Reinold on 5/29/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Model.h"
#import "Vapr.h"
#import "sensorSet.h"

@class AVPlayer;
@interface V01ViewController : UIViewController
@property (nonatomic, copy) NSURL* URL;
@property (nonatomic, strong) AVPlayer* vidPlayer;
@property int frameNum;
- (IBAction)displayNextFrame:(id)sender;
- (IBAction)displayPrevFrame:(id)sender;
- (IBAction)backClear:(id)sender;
- (IBAction)play:(id)sender;
@end
