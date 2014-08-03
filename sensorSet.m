//
//  sensorSet.m
//  VaprVideoV1
//
//  Created by Robert Reinold on 7/2/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import "sensorSet.h"
#define scale 1000 //TODO: Implement this
//TODO: Implement getSensorSet to grab normalized values

@implementation sensorSet
int accelx;
int accely;
int accelz;
int gyrox;
int gyroy;
int gyroz;
int tesla;
int frameNum;
int frameTime;

int accelxNormal,accelyNormal,accelzNormal,gyroxNormal,gyroyNormal,gyrozNormal,teslaNormal;

- (id) init{
    accelx=1;
    accely=0;
    accelz=0;
    gyrox=0;
    gyroy=0;
    gyroz=0;
    tesla=0;
    self = [super init];
    return self;
}
- (id) initWithNormalizedData:
(int)frameNumToSet:
(int)accelxToSet:
(int)accelyToSet:
(int)accelzToSet:
(int)gyroxToSet:
(int)gyroyToSet:
(int)gyrozToSet:
(int)teslaToSet{
        self = [super init];
    frameNum = frameNumToSet;
    accelx = accelxToSet;
    accely = accelyToSet;
    accelz = accelzToSet;
    gyrox = gyroxToSet;
    gyroy = gyroyToSet;
    gyroz = gyrozToSet;
    tesla = teslaToSet;

    return self;
    
}
- (void) setAccelX:(int) toSet{accelx=toSet;}
- (void) setAccelY:(int) toSet{accely=toSet;}
- (void) setAccelZ:(int) toSet{accelz=toSet;}
- (void) setGyroX:(int) toSet{gyrox=toSet;}
- (void) setGyroY:(int) toSet{gyroy=toSet;}
- (void) setGyroZ:(int) toSet{gyroz=toSet;}
- (void) setTesla:(int) toSet{tesla=toSet;}
- (void) setFrameNum:(int) frameNumToSet{frameNum = frameNumToSet;}
- (void) setFrameTime:(int) frameTimeToSet{frameTime = frameTimeToSet;}

- (int) getAccelX{return accelx;}
- (int) getAccelY{return accely;}
- (int) getAccelZ{return accelz;}
- (int) getGyroX{return gyrox;}
- (int) getGyroY{return gyroy;}
- (int) getGyroZ{return gyroz;}
- (int) getTesla{return tesla;}
- (int) getFrameNum{return frameNum;}
- (int) getFrameTime{return frameTime;}

- (void) printRaw{
    //NSLog(@"X: %f Y: %f Z: %f X: %f Y: %f Z: %f T: %f",accelx,accely,accelz,gyrox,gyroy,gyroz,tesla);
    printf("%u,%u,%u,%u,%u,%u,%u\n",accelx,accely,accelz,gyrox,gyroy,gyroz,tesla);
}


- (void) printNormalized{
    
    //create ints to truncate decimals
    int accelxNormal,accelyNormal,accelzNormal,gyroxNormal,gyroyNormal,gyrozNormal,teslaNormal;
    accelxNormal = (int) ((accelx+8)*1000/16);
    accelyNormal = (int) ((accely+8)*1000/16);
    accelzNormal = (int) ((accelz+8)*1000/16);
    gyroxNormal = (int) ((gyrox+3.14)*1000/6.28);
    gyroyNormal = (int) ((gyroy+3.14)*1000/6.28);
    gyrozNormal = (int) ((gyroz+3.14)*1000/6.28);
    teslaNormal = (int) ((tesla)*1000/359);
    //error checking
    //TODO: iterator implementation
    if(accelxNormal > 1000){accelxNormal=1000;NSLog(@"Excedes Range!\n\n");}
    else if(accelxNormal < 0){accelxNormal=0;NSLog(@"Excedes Range!\n\n");}
    if(accelyNormal > 1000){accelyNormal=1000;NSLog(@"Excedes Range!\n\n");}
    else if(accelyNormal < 0){accelyNormal=0;NSLog(@"Excedes Range!\n\n");}
    if(accelzNormal > 1000){accelzNormal=1000;NSLog(@"Excedes Range!\n\n");}
    else if(accelzNormal < 0){accelzNormal=0;NSLog(@"Excedes Range!\n\n");}
    if(gyroxNormal > 1000){gyroxNormal=1000;NSLog(@"Excedes Range!\n\n");}
    else if(gyroxNormal < 0){gyroxNormal=0;NSLog(@"Excedes Range!\n\n");}
    if(gyroyNormal > 1000){gyroyNormal=1000;NSLog(@"Excedes Range!\n\n");}
    else if(gyroyNormal < 0){gyroyNormal=0;NSLog(@"Excedes Range!\n\n");}
    if(gyrozNormal > 1000){gyrozNormal=1000;NSLog(@"Excedes Range!\n\n");}
    else if(gyrozNormal < 0){gyrozNormal=0;NSLog(@"Excedes Range!\n\n");}
    if(teslaNormal > 1000){teslaNormal=1000;NSLog(@"Excedes Range!\n\n");}
    else if(teslaNormal < 0){teslaNormal;NSLog(@"Excedes Range!\n\n");}
    
    printf("%u,%u,%u,%u,%u,%u,%u\n",accelxNormal,accelyNormal,accelzNormal,gyroxNormal,gyroyNormal,gyrozNormal,teslaNormal);
}

- (void) printNormalizedComparison: (sensorSet*)VaprSensorSetToSet{
    [self printNormalized];
    [VaprSensorSetToSet printNormalized];

            }

- (void) printPostNormalized{
    
        printf("%f,%f,%f,%f,%f,%f,%f\n",accelxNormal,accelyNormal,accelzNormal,gyroxNormal,gyroyNormal,gyrozNormal,teslaNormal);
}
- (void) normalize{
    accelxNormal = (int) ((accelx+8)*1000/16);
    accelyNormal = (int) ((accely+8)*1000/16);
    accelzNormal = (int) ((accelz+8)*1000/16);
    gyroxNormal = (int) ((gyrox+3.14)*1000/6.28);
    gyroyNormal = (int) ((gyroy+3.14)*1000/6.28);
    gyrozNormal = (int) ((gyroz+3.14)*1000/6.28);
    teslaNormal = (int) ((tesla)*1000/359);
    
    
}

@end
