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
int teslaArray[] = {0,10,20,35,40,50,60,70,80,95,105,115,125,135,145,155,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,165,175,185,195,205,215,225,235,245,255,265,275,285,295,305,315,325,335,345,360};
int accelzArray[] ={9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,476,470,462,456,450,442,444,450,458,464,470,478,484,488,494,500,504,510,516,520,526,536,542,548,552,558,558,550,542,534,526,520,512,504,496,488,480,474,466,458,450,442,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000,9000};
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
    



    
}
//called above by ViewController at 58Hz
- (int)queryCurrentFrameNum{
    
    /*for (int i = 0;i<79;i++){
        printf("entry: %u Tesla: %u, Z: %u\n",i,teslaArray[i],accelzArray[i]);
        
    }
     */
    sensorSet* currentModelSensorSet = [[sensorSet alloc] init];
    currentModelSensorSet = [sense getSensorSet]; //grab current sensor data
    
        //printf("HEY BITCH %u",[currentModelSensorSet getAccelX]);
    sensorSet* currentVaprSensorSet = [fakeSensorSetArray objectAtIndex:0]; //get first Vapr array object
    

    //NSLog(@"Vapr To Get: ");
    [currentModelSensorSet printRaw];
    printf("entry: %u Tesla: %u, Z: %u\n",CurrentFrameNum,teslaArray[CurrentFrameNum],accelzArray[CurrentFrameNum]);
    //compare with tolerance each sensor
    if(
       [currentModelSensorSet getTesla] != 9000 &&
       [self compareWithTolerance:                     [currentModelSensorSet getTesla]:                             teslaArray[CurrentFrameNum] :TOLERANCE]==1){
        CurrentFrameNum++;
        NSLog(@"Bingo!");
        
    }
    else if(
       [currentModelSensorSet getAccelZ] != 9000 &&
       [self compareWithTolerance:                     [currentModelSensorSet getTesla]:                             accelzArray[CurrentFrameNum] :TOLERANCE]==1){
        CurrentFrameNum++;
        NSLog(@"Bingo!");
        
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
