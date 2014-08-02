//
//  Model.h
//  VaprVideo_v1.0
//
//  Created by Robert Reinold on 5/28/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>
#import "Vapr.h"
#import "Sensor.h"
#import "sensorSet.h"

@interface Model : NSObject

- (id)init;
- (id)initWithVapr:(Vapr*)VaprToSet;
- (int)queryCurrentFrameNum;
- (int)compareWithTolerance:(int)toCompare:(int)VaprValue:(int)tolerance;
@property (nonatomic, retain) Sensor* sense;


@end
