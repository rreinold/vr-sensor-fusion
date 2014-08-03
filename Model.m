//
//  Model.m
//  VaprVideo_v1.0
//
//  Created by Robert Reinold on 5/28/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//TODO: 60Hz Timer: Update sensor values, and pull sensor data. Better off at 58Hz.
//TODO: Error Handling on Files. No "Broken Windows"
#import "Model.h"
#import "Vapr.h"
#define TOLERANCE 30
@implementation Model
@synthesize sense;
NSTimer* timer;
NSMutableArray* fakeSensorSetArray;
int CurrentFrameNum=0;
Vapr* VaprInUse;
- (id)init{
    self = [super init];
    sense = [[Sensor alloc] init];
    timer = [NSTimer scheduledTimerWithTimeInterval:1/58 target:self selector:@selector(getSensorSet) userInfo:nil repeats:YES];
    return self;
}
- (id)initWithVapr:(Vapr*)VaprToSet{
    self = [super init];
    VaprInUse = VaprToSet; //set Vapr
    sense = [[Sensor alloc] init]; //allocate Sensor Object
    timer = [NSTimer scheduledTimerWithTimeInterval:1/58 target:self selector:@selector(getSensorSet) userInfo:nil repeats:YES];//call empty function 58Hz
    return self;
    
    fakeSensorSetArray = [[NSMutableArray alloc] init];
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


    
}
//called above by ViewController at 58Hz
- (int)queryCurrentFrameNum{
    sensorSet* currentModelSensorSet = [[sensorSet alloc] init];
    currentModelSensorSet = [sense getSensorSet]; //grab current sensor data
    
        //printf("HEY BITCH %u",[currentModelSensorSet getAccelX]);
    sensorSet* currentVaprSensorSet = [fakeSensorSetArray objectAtIndex:0]; //get first Vapr array object
    

    //NSLog(@"Vapr To Get: ");
    [currentModelSensorSet printRaw];
    //compare with tolerance each sensor
    if(
       [currentModelSensorSet getTesla] != -1 &&
       [self compareWithTolerance:                     [currentModelSensorSet getTesla]:                            [currentVaprSensorSet getTesla]:TOLERANCE]==1){
        CurrentFrameNum++;
        NSLog(@"Bingo!");
        
    }
    else if([currentModelSensorSet getAccelY] != -1 &&
       [self compareWithTolerance:
        [currentModelSensorSet getAccelY]:
        [currentVaprSensorSet getAccelY]:
                                  TOLERANCE
        ]==1){
           //CurrentFrameNum++;
       }
    return CurrentFrameNum;
        
        
    
}

-(void)getSensorSet{
    //NSLog(@"Yeahh bitch");
}
//take tesla roundoff into account
- (int)compareWithTolerance:(int)toCompare:(int)VaprValue:(int)tolerance{
    int diff = VaprValue - toCompare;
    diff = abs(diff);
    if(diff < tolerance){return 1;}
    else{return 0;}
}



@end
