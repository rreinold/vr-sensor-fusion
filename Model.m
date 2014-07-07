//
//  Model.m
//  VaprVideo_v1.0
//
//  Created by Robert Reinold on 5/28/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//TODO: 60Hz Timer: Update sensor values, and pull sensor data. Better off at 58Hz.

#import "Model.h"
#import "Vapr.h"
#define TOLERANCE 10
@implementation Model
NSTimer* timer;
Sensor* sense;
int CurrentFrameNum=0;
- (id)init{
    self = [super init];
    sense = [[Sensor alloc] init];
    timer = [NSTimer scheduledTimerWithTimeInterval:1/58 target:self selector:@selector(getSensorSet) userInfo:nil repeats:YES];
    return self;
}
- (id)initWithVapr:(Vapr*)VaprToSet{
    self = [super init];
    //Sensor* sense = [[Sensor alloc] init];
    return self;
    
}
- (int)queryCurrentFrameNum{
    //getSensorSet
    sensorSet* currentModelSensorSet = sense.getSensorSet;
    
    //compareWithTolerance each sensor
}

-(void)getSensorSet{
    //NSLog(@"Yeahh bitch");
}

//include X sensors and parameter for it.
- (int)compareWithTolerance:(int)queryValue:(int)vaprValue:(int)tolerance{
    int diff = queryValue-vaprValue;
    if(abs(diff) <= tolerance){return 0;}
    else if (diff >=0){return 1;}
    else if (diff <0){return -1;}
    else return -2;//TODO: need alternate void return value
}
@end
