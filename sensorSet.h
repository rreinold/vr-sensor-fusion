//
//  sensorSet.h
//  VaprVideoV1
//
//  Created by Robert Reinold on 7/2/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sensorSet : NSObject
- (id) init;
- (id) initWithNormalizedData:(int)frameNumToSet:(float)accelxToSet:(float)accelyToSet:(float)accelzToSet:(float)gyroxToSet:(float)gyroyToSet:(float)gyrozToSet:(float)teslaToSet;
- (void) printRaw;
- (void) printNormalized;
- (void) printNormalizedComparison:(sensorSet*) VaprSensorSetToSet;
- (void) setAccelX:(float) toSet;
- (void) setAccelY:(float) toSet;
- (void) setAccelZ:(float) toSet;
- (void) setGyroX:(float) toSet;
- (void) setGyroY:(float) toSet;
- (void) setGyroZ:(float) toSet;
- (void) setTesla:(float) toSet;
- (void) setFrameNum:(int) frameNumToSet;
- (void) setFrameTime:(float) frameTimeToSet;

- (float) getAccelX;
- (float) getAccelY;
- (float) getAccelZ;
- (float) getGyroX;
- (float) getGyroY;
- (float) getGyroZ;
- (float) getTesla;
- (int) getFrameNum;
- (float) getFrameTime;
@end
