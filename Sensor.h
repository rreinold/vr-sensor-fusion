//
//  Sensors.h
//  VaprVideo_v1.0
//
//  Created by Robert Reinold on 5/29/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreLocation/CoreLocation.h>
#import "sensorSet.h"

@interface Sensor : NSObject <UIAccelerometerDelegate, CLLocationManagerDelegate>{
CMMotionManager *motionManager;
NSOperationQueue *operationQueue;
NSTimer *timer;
NSTimer *UItimer; //optional
}
- (void)initialize;
- (id)initWithData:(NSNumber*)requestedFreq;
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;
- (int)calcLine:(int)lineNum:(float)accelx:(float)accely:(float)accelz;
- (void)read;
@end