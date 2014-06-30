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

NSMutableArray *vaprSet;
}

@synthesize activeFrameNumber = _activeFrameNumber;// Optional for Xcode 4.4+
@synthesize activeFrame = _activeFrame;
#define NS(x) [NSNumber numberWithFloat:x]
- (NSNumber*)retrieveVapr:(NSNumber *)vaprID{
    //instantiate array
    vaprSet=[[NSMutableArray alloc] init];

}
- (NSNumber*)queryAccel:(NSNumber*)qAccelValue{}
- (NSNumber*)queryGyro:(NSNumber*)qGyroValue{}
- (NSNumber*)queryMagneto:(NSNumber*)qMagnetoValue{}

- (NSNumber*)getFrameNumber{}
- (void)pushFrame:(NSString*)toPush{
    UIImage *image = [UIImage imageNamed: toPush];
    NSString *newPhoto;
        [vaprSet addObject:[[Vapr alloc] initWithData:image:NS(-1):NS(-1):NS(-1)]];
    
    for (Vapr *thisVapr in vaprSet) {
        //NSLog(@"hey display 0 to 22 please %f",[[thisVapr getFrameNum] floatValue]);
    }
    
}
@end
