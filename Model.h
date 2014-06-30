//
//  Model.h
//  VaprVideo_v1.0
//
//  Created by Robert Reinold on 5/28/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
/*
 queryAccel
 queryGyro
 queryMagneto
 init(vapr)
 getFrame

 */

@property (retain) NSNumber *activeFrameNumber;
@property (retain) UIImage *activeFrame;
- (NSNumber*)retrieveVapr:(NSNumber *)vaprID;
- (NSNumber*)queryAccel:(NSNumber *)qAccelValue;
- (NSNumber*)queryGyro:(NSNumber *)qGyroValue;
- (NSNumber*)queryMagneto:(NSNumber *)qMagnetoValue;

- (NSNumber*)getFrameNumber;

@end
