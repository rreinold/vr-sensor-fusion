//
//  Vapr.m
//  AccelerometerTest
//
//  Created by Robert Reinold on 3/1/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import "Vapr.h"

@implementation Vapr

NSMutableArray* setHolder;
sensorSet* mask;
sensorSet* header;
-(id)init{
    self = [super init];
    return self;
}
- (id)initWithData:(NSMutableArray*)ArrayToSet{
    self = [super init];
    setHolder = ArrayToSet;
    return self;
    
}
- (void)setVideo:(NSURL*)videoLocationToSet{}
- (void)setSensorSetArray:(NSMutableArray*)sensorSetArrayToSet{
//setHolder = [[NSMutableArray alloc] init];
}
- (void)setVaprName:(NSString*)VaprNameToSet{}
- (void)setVaprID:(NSString*)VaprIDToSet{}

//TODO: Implement header and mask
- (void)setVaprHeaderSet:(sensorSet*)headerToSet{
    header = headerToSet;
}
- (void)setVaprMaskSet:(sensorSet*)maskToSet{
    mask = maskToSet;
}
- (sensorSet*)getVaprHeaderSet{return header;}
- (sensorSet*)getVaprMaskSet{return mask;}
- (NSURL*)getVideo{}
- (NSMutableArray*)getSensorSetArray{return setHolder;}
- (NSString*)getVaprName{}
- (NSString*)getVaprID{}

@end



