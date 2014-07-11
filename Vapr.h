//
//  Vapr.h
//  AccelerometerTest
//
//  Created by Robert Reinold on 3/1/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sensorSet.h"

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

//TODO: Remove 3 Lines, keep  atm for reference
@property (retain) NSNumber *frameNum;
@property (retain) UIImage *fascia;
@property (retain) NSNumber *g;

- (id)init;
- (id)initWithData:(NSMutableArray*)ArrayToSet;
- (id)setMask:(sensorSet*)maskToSet;
- (void)setVideo:(NSURL*)videoLocationToSet;
- (void)setSensorSetArray:(NSMutableArray*)sensorSetArrayToSet;
- (void)setVaprName:(NSString*)VaprNameToSet;
- (void)setVaprID:(NSString*)VaprIDToSet;
- (void)setVaprHeaderSet:(sensorSet*)headerToSet;
- (void)setVaprMaskSet:(sensorSet*)maskToSet;

- (NSURL*)getVideo;
- (NSMutableArray*)getSensorSetArray;
- (NSString*)getVaprName;
- (NSString*)getVaprID;
- (sensorSet*)getVaprHeaderSet;
- (sensorSet*)getVaprMaskSet;

@end

