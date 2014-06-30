//
//  Vapr.h
//  AccelerometerTest
//
//  Created by Robert Reinold on 3/1/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vapr : NSObject
{
    // Protected instance variables (not recommended)
}
//holds
//1. Full Video
//2. Length in seconds
//3. Name
//4. Fascia
//5. Node Graph w Data
//6. 
@property (retain) NSNumber *frameNum;
@property (retain) UIImage *image;
@property (retain) NSNumber *gyro;
@property (retain) NSNumber *accel;

- (void)drive;
- (NSNumber*)getFrameNum;
- (UIImage*)getImage;
- (NSNumber*)getAccelY;
- (NSNumber*)getGyro;

- (void)setAccelY:(NSNumber *)ac;
- (void)setGyro:(NSNumber *)gy;
- (id)initWithData:(UIImage*)im:(NSNumber *)fr:(NSNumber*)gy:(NSNumber*)ac;

@end

