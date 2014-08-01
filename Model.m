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
    VaprInUse = VaprToSet;
    sense = [[Sensor alloc] init];
    timer = [NSTimer scheduledTimerWithTimeInterval:1/58 target:self selector:@selector(getSensorSet) userInfo:nil repeats:YES];
    return self;
    
}
- (int)queryCurrentFrameNum{
    //getSensorSet
    sensorSet* currentModelSensorSet = [sense getSensorSet];
    sensorSet * currentVaprSensorSet = [VaprInUse.getSensorSetArray objectAtIndex:(0) ];
[self compareWithTolerance:
 (currentModelSensorSet):
  (currentVaprSensorSet):
 (TOLERANCE) ];
    //compareWithTolerance each sensor
}

-(void)getSensorSet{
    //NSLog(@"Yeahh bitch");
}

//include X sensors and parameter for it.
- (int)compareWithTolerance:(sensorSet*)liveSensorSet:(sensorSet*)VaprSensorSet:(int)tolerance{
    //if >0 compare else skip
    
    //TODO: Fuck this.
    //[sense printRaw];
    [sense getSensorSet];
    return 1;
}


@end
