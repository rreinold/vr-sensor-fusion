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
float accelx;
float accely;
float accelz;
float gyrox;
float gyroy;
float gyroz;
float tesla;

- (id) init{
    accelx=0;
    accely=0;
    accelz=0;
    gyrox=0;
    gyroy=0;
    gyroz=0;
    tesla=0;
    self = [super init];
    return self;
}

- (void) setAccelX:(float) toSet{accelx=toSet;}
- (void) setAccelY:(float) toSet{accely=toSet;}
- (void) setAccelZ:(float) toSet{accelz=toSet;}
- (void) setGyroX:(float) toSet{gyrox=toSet;}
- (void) setGyroY:(float) toSet{gyroy=toSet;}
- (void) setGyroZ:(float) toSet{gyroz=toSet;}
- (void) setTesla:(float) toSet{tesla=toSet;}

- (float) getAccelX{return accelx;}
- (float) getAccelY{return accely;}
- (float) getAccelZ{return accelz;}
- (float) getGyroX{return gyrox;}
- (float) getGyroY{return gyroy;}
- (float) getGyroZ{return gyroz;}
- (float) getTesla{return tesla;}

- (void) printRaw{
    //NSLog(@"X: %f Y: %f Z: %f X: %f Y: %f Z: %f T: %f",accelx,accely,accelz,gyrox,gyroy,gyroz,tesla);
    printf("%f,%f,%f,%f,%f,%f,%f\n",accelx,accely,accelz,gyrox,gyroy,gyroz,tesla);
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

@end
