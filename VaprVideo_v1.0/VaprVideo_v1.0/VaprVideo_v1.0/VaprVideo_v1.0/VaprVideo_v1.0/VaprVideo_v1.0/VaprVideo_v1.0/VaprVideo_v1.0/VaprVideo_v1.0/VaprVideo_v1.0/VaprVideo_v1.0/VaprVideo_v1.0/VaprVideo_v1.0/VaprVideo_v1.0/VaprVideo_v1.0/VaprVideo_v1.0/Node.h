//
//  Node.h
//  VaprVideoV1
//
//  Created by Robert Reinold on 6/25/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (retain) NSNumber *frameNum;
@property (retain) UIImage *image;
@property (retain) NSNumber *gyro;
@property (retain) NSNumber *accel;


- (NSNumber*)getFrameNum;

- (NSNumber*)getAccelY;
- (NSNumber*)getGyro;

- (void)setAccelY:(NSNumber *)ac;
- (void)setGyro:(NSNumber *)gy;
- (id)initWithData:(UIImage*)im:(NSNumber *)fr:(NSNumber*)gy:(NSNumber*)ac;

@end