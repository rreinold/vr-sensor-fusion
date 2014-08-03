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
Model* modelInUse;
@synthesize vidPlayer,frameNum;
NSTimer* timer;
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
    
    //==========Begin AVPlayer Setup==========
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"test6" ofType:@"mov"]; //Set path for Vapr Video
    NSURL *fileURL = [NSURL fileURLWithPath:filepath]; //Create URL Object with Vapr Video Path
    vidPlayer = [[AVPlayer alloc] initWithURL:fileURL]; //initialize and allocate AVPlayer
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.vidPlayer]; //Pass AVPlayer up to visible layer
    self.vidPlayer.actionAtItemEnd = AVPlayerActionAtItemEndNone; //Do nothing at end of item
    layer.frame = CGRectMake(0,0,320,568);//Set size of AVPlayerLayer object
    [self.view.layer addSublayer:layer]; //Add AVPlayerLayer to current view
    NSLog(@"Video Path:%@\n",filepath);
    //==========End AVPlayer Setup==========
    
    //==========Begin Object & Timer Setup==========
    frameNum=0;
    Vapr* currentVapr = [self createFakeVapr];
    modelInUse = [[Model alloc] initWithVapr:currentVapr];
    timer = [NSTimer scheduledTimerWithTimeInterval:1/10 target:self selector:@selector(queryFrameNum) userInfo:nil repeats:YES];
    //==========End Object & Timer Setup==========
}

- (void)queryFrameNum{ //to be called by timer 58Hz
    int nextFrame = [modelInUse queryCurrentFrameNum]; //query sensors, sensor data processing, return frame
    if(nextFrame != frameNum){ //if new frame, display it
        frameNum = nextFrame;
        [self displayFrameProg:(frameNum)];
    }
}

//TODO: implement dictionaryWithObjectsAndKeys:
- (Vapr*)createFakeVapr{
    NSMutableArray* fakeSensorSetArray = [[NSMutableArray alloc] init];
    //fakeSensorSetArray
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(0):(-1):(-1):(-1):(-1):(-1):(-1):(0)]];
    NSLog(@"Should be -1 0: %u, %u\n",[[fakeSensorSetArray objectAtIndex:0] getTesla]);
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(1):(-1):(-1):(-1):(-1):(-1):(-1):(10)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(2):(-1):(-1):(-1):(-1):(-1):(-1):(20)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(3):(-1):(-1):(-1):(-1):(-1):(-1):(35)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(4):(-1):(-1):(-1):(-1):(-1):(-1):(40)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(5):(-1):(-1):(-1):(-1):(-1):(-1):(50)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(6):(-1):(-1):(-1):(-1):(-1):(-1):(60)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(7):(-1):(-1):(-1):(-1):(-1):(-1):(70)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(8):(-1):(-1):(-1):(-1):(-1):(-1):(80)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(9):(-1):(-1):(-1):(-1):(-1):(-1):(95)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(10):(-1):(-1):(-1):(-1):(-1):(-1):(105)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(11):(-1):(-1):(-1):(-1):(-1):(-1):(115)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(12):(-1):(-1):(-1):(-1):(-1):(-1):(125)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(13):(-1):(-1):(-1):(-1):(-1):(-1):(135)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(14):(-1):(-1):(-1):(-1):(-1):(-1):(145)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(15):(-1):(-1):(-1):(-1):(-1):(-1):(155)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(16):(-1):(-1):(-1):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(17):(-1):(-1):(476):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(18):(-1):(-1):(470):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(19):(-1):(-1):(462):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(20):(-1):(-1):(456):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(21):(-1):(-1):(450):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(22):(-1):(-1):(442):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(23):(-1):(-1):(444):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(24):(-1):(-1):(450):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(25):(-1):(-1):(458):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(26):(-1):(-1):(464):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(27):(-1):(-1):(470):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(28):(-1):(-1):(478):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(29):(-1):(-1):(484):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(30):(-1):(-1):(488):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(31):(-1):(-1):(494):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(32):(-1):(-1):(500):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(33):(-1):(-1):(504):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(34):(-1):(-1):(510):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(35):(-1):(-1):(516):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(36):(-1):(-1):(520):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(37):(-1):(-1):(526):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(38):(-1):(-1):(531):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(39):(-1):(-1):(536):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(40):(-1):(-1):(542):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(41):(-1):(-1):(548):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(42):(-1):(-1):(552):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(43):(-1):(-1):(558):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(44):(-1):(-1):(558):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(45):(-1):(-1):(550):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(46):(-1):(-1):(542):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(47):(-1):(-1):(534):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(48):(-1):(-1):(526):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(49):(-1):(-1):(520):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(50):(-1):(-1):(512):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(51):(-1):(-1):(504):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(52):(-1):(-1):(496):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(53):(-1):(-1):(488):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(54):(-1):(-1):(480):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(55):(-1):(-1):(474):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(56):(-1):(-1):(466):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(57):(-1):(-1):(458):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(58):(-1):(-1):(450):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(59):(-1):(-1):(442):(-1):(-1):(-1):(160)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(60):(-1):(-1):(-1):(-1):(-1):(-1):(165)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(61):(-1):(-1):(-1):(-1):(-1):(-1):(175)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(62):(-1):(-1):(-1):(-1):(-1):(-1):(185)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(63):(-1):(-1):(-1):(-1):(-1):(-1):(195)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(64):(-1):(-1):(-1):(-1):(-1):(-1):(205)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(65):(-1):(-1):(-1):(-1):(-1):(-1):(215)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(66):(-1):(-1):(-1):(-1):(-1):(-1):(225)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(67):(-1):(-1):(-1):(-1):(-1):(-1):(235)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(68):(-1):(-1):(-1):(-1):(-1):(-1):(245)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(69):(-1):(-1):(-1):(-1):(-1):(-1):(255)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(70):(-1):(-1):(-1):(-1):(-1):(-1):(265)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(71):(-1):(-1):(-1):(-1):(-1):(-1):(275)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(72):(-1):(-1):(-1):(-1):(-1):(-1):(285)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(73):(-1):(-1):(-1):(-1):(-1):(-1):(295)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(74):(-1):(-1):(-1):(-1):(-1):(-1):(305)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(75):(-1):(-1):(-1):(-1):(-1):(-1):(315)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(76):(-1):(-1):(-1):(-1):(-1):(-1):(325)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(77):(-1):(-1):(-1):(-1):(-1):(-1):(335)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(78):(-1):(-1):(-1):(-1):(-1):(-1):(345)]];
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(79):(-1):(-1):(-1):(-1):(-1):(-1):(360)]];
    Vapr* fakeVapr = [[Vapr alloc] initWithData:fakeSensorSetArray];
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"test6" ofType:@"mov"];
    NSURL *fileURL = [NSURL fileURLWithPath:filepath];
    [fakeVapr setVideo:fileURL];
    [fakeVapr setVaprName:(@"Chacchoben Ruins")];
    //TODO:set header in model
    return fakeVapr;
}
//==========Begin Systematic Next Frame==========
- (void)displayNextFrameProg:(int)frameNumToSet{
    int32_t timeScale = self.vidPlayer.currentItem.asset.duration.timescale;
    frameNum++;
    double frame=.04*frameNumToSet;
    CMTime time = CMTimeMakeWithSeconds(frame, timeScale);
    [self.vidPlayer seekToTime:time toleranceBefore:CMTimeMakeWithSeconds(0.004,NSEC_PER_SEC) toleranceAfter:CMTimeMakeWithSeconds(0.004,NSEC_PER_SEC) ];
    [self printTime:(frame)];
}

- (void)displayPrevFrameProg:(int)frameNumToSet{
    int32_t timeScale = self.vidPlayer.currentItem.asset.duration.timescale;
    frameNum--;
    double frame=.04*frameNumToSet;
    CMTime time = CMTimeMakeWithSeconds(frame, timeScale);
    [self.vidPlayer seekToTime:time toleranceBefore:CMTimeMakeWithSeconds(0.004,NSEC_PER_SEC) toleranceAfter:CMTimeMakeWithSeconds(0.004,NSEC_PER_SEC) ];
    [self printTime:(frame)];
    
}

- (void)displayFrameProg:(int)frameNumToSet{
    int32_t timeScale = self.vidPlayer.currentItem.asset.duration.timescale;
    double frame=.04*frameNumToSet;
    CMTime time = CMTimeMakeWithSeconds(frame, timeScale);
    [self.vidPlayer seekToTime:time toleranceBefore:CMTimeMakeWithSeconds(0.004,NSEC_PER_SEC) toleranceAfter:CMTimeMakeWithSeconds(0.004,NSEC_PER_SEC) ];
    [self printTime:(frame)];
}
//==========End Systematic Next Frame==========

//==========Begin UI Next Frame==========
- (IBAction)displayNextFrame:(id)sender{
    int32_t timeScale = self.vidPlayer.currentItem.asset.duration.timescale;
    frameNum++;
    double frame=.04*frameNum;
    CMTimeShow(self.vidPlayer.currentItem.asset.duration);
    CMTime time = CMTimeMakeWithSeconds(frame, timeScale);
    //TODO: CHange to 29Hz for v1
    [self.vidPlayer seekToTime:time toleranceBefore:CMTimeMakeWithSeconds(0.004,NSEC_PER_SEC) toleranceAfter:CMTimeMakeWithSeconds(0.004,NSEC_PER_SEC) ];
    [self printTime:(frame)];
}

-(void)printTime:(double)timeToPrint{
        NSLog(@"FrameNum = %f setTime = %f",frameNum,timeToPrint,
              CMTimeGetSeconds([self.vidPlayer currentTime])
              );
    }
//TODO: CHange to 29Hz for v1
- (IBAction)displayPrevFrame:(id)sender{
    int32_t timeScale = self.vidPlayer.currentItem.asset.duration.timescale;
    frameNum--;
    double frame=.04*frameNum;
    CMTimeShow(self.vidPlayer.currentItem.asset.duration);
    CMTime time = CMTimeMakeWithSeconds(frame, timeScale);
    //TODO: CHange to 29Hz for v1
    [self.vidPlayer seekToTime:time toleranceBefore:CMTimeMakeWithSeconds(0.004,NSEC_PER_SEC) toleranceAfter:CMTimeMakeWithSeconds(0.004,NSEC_PER_SEC) ];
    [self printTime:(frame)];
}
//==========End UI Next Frame==========

//Reset Player
- (IBAction)backClear:(id)sender{
    
    frameNum=0;
}
//Play the entire video
- (IBAction)play:(id)sender{
    [self.vidPlayer play];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
