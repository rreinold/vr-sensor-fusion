//
//  Model.m
//  VaprVideo_v1.0
//
//  Created by Robert Reinold on 5/28/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import "Model.h"
#import "Vapr.h"

@implementation Model{


}

@synthesize activeFrameNumber = _activeFrameNumber;// Optional for Xcode 4.4+
@synthesize activeFrame = _activeFrame;
#define NS(x) [NSNumber numberWithFloat:x]

- (id)init:(Vapr*)VaprToSet{
    self = [super init];
    Vapr* current = VaprToSet;
    return self;
}

- (NSNumber*)retrieveVapr:(NSNumber *)vaprID{
    
    

}
- (NSNumber*)queryAccel:(NSNumber*)qAccelValue{}
- (NSNumber*)queryGyro:(NSNumber*)qGyroValue{}
- (NSNumber*)queryMagneto:(NSNumber*)qMagnetoValue{}

- (NSNumber*)getFrameNumber{}
- (void)pushFrame:(NSString*)toPush{

    
}

- (int)compareWithTolerance:(int)queryValue:(int)vaprValue:(int)tolerance{
    int diff = queryValue-vaprValue;
    if(abs(diff) <= tolerance){return 0;}
    else if (diff >=0){return 1;}
    else if (diff <0){return -1;}
    else return -2;//TODO: need alternate void return value
}
@end
