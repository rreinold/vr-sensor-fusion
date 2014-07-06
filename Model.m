//
//  Model.m
//  VaprVideo_v1.0
//
//  Created by Robert Reinold on 5/28/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import "Model.h"
#import "Vapr.h"

@implementation Model
- (id)init{
    self = [super init];
    Sensor* sense = [[Sensor alloc] init];
    return self;
    
    
}
- (id)initWithVapr:(Vapr*)VaprToSet{
    self = [super init];
    //Sensor* sense = [[Sensor alloc] init];
    return self;

}
- (int)queryFrameNum{
    //getSensorSet
    //compareWithTolerance each sensor
    
}
//include X sensors and parameter for it.
- (int)compareWithTolerance:(int)queryValue:(int)vaprValue:(int)tolerance{
    int diff = queryValue-vaprValue;
    if(abs(diff) <= tolerance){return 0;}
    else if (diff >=0){return 1;}
    else if (diff <0){return -1;}
    else return -2;//TODO: need alternate void return value
}
@end
