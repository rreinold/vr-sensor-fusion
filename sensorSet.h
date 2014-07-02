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
- (void) printRaw;
- (void) printNormalized;
- (void) setAccelX:(float) toSet;
- (void) setAccelY:(float) toSet;
- (void) setAccelZ:(float) toSet;
- (void) setGyroX:(float) toSet;
- (void) setGyroY:(float) toSet;
- (void) setGyroZ:(float) toSet;
- (void) setTesla:(float) toSet;

- (float) getAccelX;
- (float) getAccelY;
- (float) getAccelZ;
- (float) getGyroX;
- (float) getGyroY;
- (float) getGyroZ;
- (float) getTesla;

@end
