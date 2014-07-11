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
    
    
    
    
	NSString *filepath = [[NSBundle mainBundle] pathForResource:@"test6" ofType:@"mov"];
    NSURL *fileURL = [NSURL fileURLWithPath:filepath];
    vidPlayer = [[AVPlayer alloc] initWithURL:fileURL];
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.vidPlayer];
    self.vidPlayer.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    layer.frame = CGRectMake(0,0,320,568);
    [self.view.layer addSublayer:layer];
    
    //[self.vidPlayer play];
    NSLog(@"Playing video at %@",filepath);
    Vapr* currentVapr = [self createFakeVapr];
    Model* modelInUse = [[Model alloc] initWithVapr:currentVapr];
    //Model* modelInUse = [[Model alloc] init];
    
}
//TODO: implement dictionaryWithObjectsAndKeys:
- (Vapr*)createFakeVapr{
    NSMutableArray* fakeSensorSetArray = [[NSMutableArray alloc] init];
    //fakeSensorSetArray
    //create NSMutableArray of fake values
    //self.__ needs to be property
    [fakeSensorSetArray addObject:[[sensorSet alloc] initWithNormalizedData:(0):(-1):(-1):(-1):(-1):(-1):(-1):(0)]];
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
    
    
    /*
     (0):(-1):(-1):(-1):(-1):(-1):(-1):(0
     (1):(-1):(-1):(-1):(-1):(-1):(-1):(10
     (2):(-1):(-1):(-1):(-1):(-1):(-1):(20
     (3):(-1):(-1):(-1):(-1):(-1):(-1):(35
     (4):(-1):(-1):(-1):(-1):(-1):(-1):(40
     (5):(-1):(-1):(-1):(-1):(-1):(-1):(50
     (6):(-1):(-1):(-1):(-1):(-1):(-1):(60
     (7):(-1):(-1):(-1):(-1):(-1):(-1):(70
     (8):(-1):(-1):(-1):(-1):(-1):(-1):(80
     (9):(-1):(-1):(-1):(-1):(-1):(-1):(95
     (10):(-1):(-1):(-1):(-1):(-1):(-1):(105
     (11):(-1):(-1):(-1):(-1):(-1):(-1):(115
     (12):(-1):(-1):(-1):(-1):(-1):(-1):(125
     (13):(-1):(-1):(-1):(-1):(-1):(-1):(135
     (14):(-1):(-1):(-1):(-1):(-1):(-1):(145
     (15):(-1):(-1):(-1):(-1):(-1):(-1):(155
     (16):(-1):(-1):(-1):(-1):(-1):(-1):(160
     (17):(-1):(-1):(476):(-1):(-1):(-1):(160
     (18):(-1):(-1):(470):(-1):(-1):(-1):(160
     (19):(-1):(-1):(462):(-1):(-1):(-1):(160
     (20):(-1):(-1):(456):(-1):(-1):(-1):(160
     (21):(-1):(-1):(450):(-1):(-1):(-1):(160
     (22):(-1):(-1):(442):(-1):(-1):(-1):(160
     (23):(-1):(-1):(444):(-1):(-1):(-1):(160
     (24):(-1):(-1):(450):(-1):(-1):(-1):(160
     (25):(-1):(-1):(458):(-1):(-1):(-1):(160
     (26):(-1):(-1):(464):(-1):(-1):(-1):(160
     (27):(-1):(-1):(470):(-1):(-1):(-1):(160
     (28):(-1):(-1):(478):(-1):(-1):(-1):(160
     (29):(-1):(-1):(484):(-1):(-1):(-1):(160
     (30):(-1):(-1):(488):(-1):(-1):(-1):(160
     (31):(-1):(-1):(494):(-1):(-1):(-1):(160
     (32):(-1):(-1):(500):(-1):(-1):(-1):(160
     (33):(-1):(-1):(504):(-1):(-1):(-1):(160
     (34):(-1):(-1):(510):(-1):(-1):(-1):(160
     (35):(-1):(-1):(516):(-1):(-1):(-1):(160
     (36):(-1):(-1):(520):(-1):(-1):(-1):(160
     (37):(-1):(-1):(526):(-1):(-1):(-1):(160
     (38):(-1):(-1):(531):(-1):(-1):(-1):(160
     (39):(-1):(-1):(536):(-1):(-1):(-1):(160
     (40):(-1):(-1):(542):(-1):(-1):(-1):(160
     (41):(-1):(-1):(548):(-1):(-1):(-1):(160
     (42):(-1):(-1):(552):(-1):(-1):(-1):(160
     (43):(-1):(-1):(558):(-1):(-1):(-1):(160
     (44):(-1):(-1):(558):(-1):(-1):(-1):(160
     (45):(-1):(-1):(550):(-1):(-1):(-1):(160
     (46):(-1):(-1):(542):(-1):(-1):(-1):(160
     (47):(-1):(-1):(534):(-1):(-1):(-1):(160
     (48):(-1):(-1):(526):(-1):(-1):(-1):(160
     (49):(-1):(-1):(520):(-1):(-1):(-1):(160
     (50):(-1):(-1):(512):(-1):(-1):(-1):(160
     (51):(-1):(-1):(504):(-1):(-1):(-1):(160
     (52):(-1):(-1):(496):(-1):(-1):(-1):(160
     (53):(-1):(-1):(488):(-1):(-1):(-1):(160
     (54):(-1):(-1):(480):(-1):(-1):(-1):(160
     (55):(-1):(-1):(474):(-1):(-1):(-1):(160
     (56):(-1):(-1):(466):(-1):(-1):(-1):(160
     (57):(-1):(-1):(458):(-1):(-1):(-1):(160
     (58):(-1):(-1):(450):(-1):(-1):(-1):(160
     (59):(-1):(-1):(442):(-1):(-1):(-1):(160
     (60):(-1):(-1):(-1):(-1):(-1):(-1):(165
     (61):(-1):(-1):(-1):(-1):(-1):(-1):(175
     (62):(-1):(-1):(-1):(-1):(-1):(-1):(185
     (63):(-1):(-1):(-1):(-1):(-1):(-1):(195
     (64):(-1):(-1):(-1):(-1):(-1):(-1):(205
     (65):(-1):(-1):(-1):(-1):(-1):(-1):(215
     (66):(-1):(-1):(-1):(-1):(-1):(-1):(225
     (67):(-1):(-1):(-1):(-1):(-1):(-1):(235
     (68):(-1):(-1):(-1):(-1):(-1):(-1):(245
     (69):(-1):(-1):(-1):(-1):(-1):(-1):(255
     (70):(-1):(-1):(-1):(-1):(-1):(-1):(265
     (71):(-1):(-1):(-1):(-1):(-1):(-1):(275
     (72):(-1):(-1):(-1):(-1):(-1):(-1):(285
     (73):(-1):(-1):(-1):(-1):(-1):(-1):(295
     (74):(-1):(-1):(-1):(-1):(-1):(-1):(305
     (75):(-1):(-1):(-1):(-1):(-1):(-1):(315
     (76):(-1):(-1):(-1):(-1):(-1):(-1):(325
     (77):(-1):(-1):(-1):(-1):(-1):(-1):(335
     (78):(-1):(-1):(-1):(-1):(-1):(-1):(345
     (79):(-1):(-1):(-1):(-1):(-1):(-1):(360
     */

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
    //TODO: CHange to 29Hz for v1
    [self.vidPlayer seekToTime:time toleranceBefore:CMTimeMakeWithSeconds(0.004,NSEC_PER_SEC) toleranceAfter:CMTimeMakeWithSeconds(0.004,NSEC_PER_SEC) ];
    
    //[self.mPlayer seekToTime:CMTimeMakeWithSeconds(time, NSEC_PER_SEC)];
    [self printTime:(frame)];
    
}
-(void)printTime:(double)timeToPrint{
        NSLog(@"FrameNum = %f setTime = %f realTime = %f",frameNum,timeToPrint,
              CMTimeGetSeconds([self.vidPlayer currentTime])
              );
    }
//TODO: CHange to 29Hz for v1
- (IBAction)displayPrevFrame:(id)sender{
    int32_t timeScale = self.vidPlayer.currentItem.asset.duration.timescale;
    frameNum--;
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
    //TODO: CHange to 29Hz for v1
    [self.vidPlayer seekToTime:time toleranceBefore:CMTimeMakeWithSeconds(0.004,NSEC_PER_SEC) toleranceAfter:CMTimeMakeWithSeconds(0.004,NSEC_PER_SEC) ];
    
    //[self.mPlayer seekToTime:CMTimeMakeWithSeconds(time, NSEC_PER_SEC)];
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
