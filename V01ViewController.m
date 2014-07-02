//
//  V02ViewController.m
//  VaprVideoV1
//
//  Created by Robert Reinold on 6/23/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import "V01ViewController.h"
#import "Sensor.h";
#define NSCast(x) [NSNumber numberWithFloat:x]
@interface V01ViewController ()

@end

@implementation V01ViewController

@synthesize vidPlayer;
double frameNum=0;
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
    
    Sensor *sense = [[Sensor alloc] initWithData:NSCast(60)] ;
    
    
	NSString *filepath = [[NSBundle mainBundle] pathForResource:@"test6" ofType:@"mov"];
    NSURL *fileURL = [NSURL fileURLWithPath:filepath];
    vidPlayer = [[AVPlayer alloc] initWithURL:fileURL];
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.vidPlayer];
    self.vidPlayer.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    layer.frame = CGRectMake(0,0,320,568);
    [self.view.layer addSublayer:layer];
    
    //[self.vidPlayer play];
    NSLog(@"Playing video at %@",filepath);
        
    
    
}

- (IBAction)displayNextFrame:(id)sender{
    int32_t timeScale = self.vidPlayer.currentItem.asset.duration.timescale;
    frameNum++;
    double frame=.04*frameNum;
    printf("Duration: ");
    CMTimeShow(self.vidPlayer.currentItem.asset.duration);
    printf("\nDictated Time: %f\n\n",frame);
    if(
       CMTimeCompare(CMTimeMakeWithSeconds(frame,timeScale),
        self.vidPlayer.currentItem.asset.duration
                     )){

        NSLog(@"Video Finished. Ignoring Next");
        //return;
    }
    
        CMTime time = CMTimeMakeWithSeconds(frame, timeScale);
    [self.vidPlayer seekToTime:time toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero];
    
    //[self.mPlayer seekToTime:CMTimeMakeWithSeconds(time, NSEC_PER_SEC)];
    [self printTime:(frame)];
    
}
-(void)printTime:(double)timeToPrint{
        NSLog(@"FrameNum = %f setTime = %f realTime = %f",frameNum,timeToPrint,
              CMTimeGetSeconds([self.vidPlayer currentTime])
              );
    }

- (IBAction)displayPrevFrame:(id)sender{
double frame=.04*frameNum;
frameNum--;
    if(frameNum<0){return;}
int32_t timeScale = self.vidPlayer.currentItem.asset.duration.timescale;
CMTime time = CMTimeMakeWithSeconds(frame, timeScale);
[self.vidPlayer seekToTime:time toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero];
    [self printTime:(frame)];
}

- (IBAction)backClear:(id)sender{
    
    frameNum=0;
}

- (IBAction)play:(id)sender{
    [self.vidPlayer play];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
