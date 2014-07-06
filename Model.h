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

@interface Model : NSObject

- (id)init;
- (id)initWithVapr:(Vapr*)VaprToSet;
- (int)queryFrameNum;
- (int)compareWithTolerance:(int)queryValue:(int)vaprValue:(int)tolerance;



@end
