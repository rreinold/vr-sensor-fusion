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
#define TOLERANCE 10
@implementation Model
@synthesize sense;
NSTimer* timer;

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
    
}
//called above by ViewController at 58Hz
- (int)queryCurrentFrameNum{
    sensorSet* currentModelSensorSet = [sense getSensorSet]; //grab current sensor data
    [currentModelSensorSet normalize]; //normalize sensor data to (0,1000)
    sensorSet* currentVaprSensorSet = [VaprInUse.getSensorSetArray objectAtIndex:(CurrentFrameNum)]; //get first Vapr array object
    //compare with tolerance each sensor
    if(
       [currentModelSensorSet getTesla] != -1 &&
       [self compareWithTolerance:                     [currentModelSensorSet getTesla]:                            [currentVaprSensorSet getTesla]:TOLERANCE]==1){
        //CurrentFrameNum++;
    }
    else if([currentModelSensorSet getAccelY] != -1 &&
       [self compareWithTolerance:
        [currentModelSensorSet getAccelY]:
        [currentVaprSensorSet getAccelY]:
                                  TOLERANCE
        ]==1){
           //CurrentFrameNum++;
       }
        
        
    
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
