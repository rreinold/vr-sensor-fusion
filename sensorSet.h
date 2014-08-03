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
- (id) initWithNormalizedData:(int)frameNumToSet:(int)accelxToSet:(int)accelyToSet:(int)accelzToSet:(int)gyroxToSet:(int)gyroyToSet:(int)gyrozToSet:(int)teslaToSet;
- (void) printRaw;
- (void) printNormalized;
- (void) printNormalizedComparison:(sensorSet*) VaprSensorSetToSet;
- (void) printPostNormalized;
- (void) normalize;
- (void) setAccelX:(int) toSet;
- (void) setAccelY:(int) toSet;
- (void) setAccelZ:(int) toSet;
- (void) setGyroX:(int) toSet;
- (void) setGyroY:(int) toSet;
- (void) setGyroZ:(int) toSet;
- (void) setTesla:(int) toSet;
- (void) setFrameNum:(int) frameNumToSet;
- (void) setFrameTime:(int) frameTimeToSet;

- (int) getAccelX;
- (int) getAccelY;
- (int) getAccelZ;
- (int) getGyroX;
- (int) getGyroY;
- (int) getGyroZ;
- (int) getTesla;
- (int) getFrameNum;
- (int) getFrameTime;
@end
