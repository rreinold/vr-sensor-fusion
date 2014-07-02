//
//  sensorSet.m
//  VaprVideoV1
//
//  Created by Robert Reinold on 7/2/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import "sensorSet.h"

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

- (void) print{
    //NSLog(@"X: %f Y: %f Z: %f X: %f Y: %f Z: %f T: %f",accelx,accely,accelz,gyrox,gyroy,gyroz,tesla);
    printf("%f,%f,%f,%f,%f,%f,%f\n",accelx,accely,accelz,gyrox,gyroy,gyroz,tesla);
}

@end
