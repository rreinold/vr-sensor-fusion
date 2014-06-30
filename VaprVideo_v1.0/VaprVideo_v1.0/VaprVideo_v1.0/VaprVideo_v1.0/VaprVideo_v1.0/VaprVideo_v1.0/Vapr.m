//
//  Vapr.m
//  AccelerometerTest
//
//  Created by Robert Reinold on 3/1/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import "Vapr.h"

@implementation Vapr
{
    // Private instance variables
    double _odometer;
}

@synthesize frameNum = _frameNum;// Optional for Xcode 4.4+
@synthesize image = _image;
@synthesize gyro = _gyro;
@synthesize accel = _accel;


- (UIImage*)getImage {
    return self.image;
}
- (NSNumber*)getAccelY{return _accel;}

- (NSNumber*)getFrameNum {
    return self.frameNum;
}

- (NSNumber *)getGyro{return _gyro;}

- (void)setAccelY:(NSNumber *)ac{_accel=ac;}

- (void)setGyro:(NSNumber *)gyro{
    _gyro = gyro;
}

- (id)initWithData:(UIImage*)im:(NSNumber *)fr:(NSNumber*)gy:(NSNumber*)ac;{
    self = [super init];
    _image = im;
    _frameNum = fr;
    _gyro=gy;
    _accel=ac;
    return self;
}



@end

