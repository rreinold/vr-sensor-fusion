//
//  Sensors.m
//  VaprVideo_v1.0
//
//  Created by Robert Reinold on 5/29/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import "Sensor.h"
#import <CoreLocation/CoreLocation.h>

@interface Sensor()

@property (retain, nonatomic) CLLocationManager *locationManager;
@property (retain, nonatomic) CLHeading *currentHeading;

@end

@implementation Sensor
sensorSet *currentSet;//TODO: Here or in a property above?
- (id)initWithData:(NSNumber*)requestedFreq{
    self = [super init];
    NSLog(@"Accelerometer Frequency: %@",requestedFreq);
    [self initialize];
    [self initTesla];
    currentSet = [[sensorSet alloc] init];
    return self;
}

- (void)initTesla{
    self.currentHeading=[[CLHeading alloc] init];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.headingFilter = 1;
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingHeading];
}

#pragma Location Manager Methods

- (void)locationManager:(CLLocationManager*)manager didUpdateHeading:(CLHeading*)newHeading{
    self.currentHeading = newHeading;
    //self.headingLabel.text = [NSString stringWithFormat:@"%d, (int)newHeading.magneticHeading];
    //NSLog(@"Magnetic Reading: %i",(int)newHeading.magneticHeading);
    [currentSet setTesla:((float)newHeading.magneticHeading)];
}
- (BOOL)locationManagerShowShouldDisplayHeadingCalibration:(CLLocationManager*)manager{
    if(self.currentHeading == nil)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (void)initialize{
    
    //======Accelerometer Setup======
	UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
    accel.delegate = self;
    accel.updateInterval = 1.0f/25.0f; //Hz //60 to 1
    //====End Accelerometer Setup=======
    //=====Start Gyro Setup=============
    //Moving average setup
    motionManager = [[CMMotionManager alloc]init];
    motionManager.deviceMotionUpdateInterval = 1/25;//60 to 1
    [motionManager startDeviceMotionUpdates];
    timer = [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(read) userInfo:nil repeats:YES];//60 to 1
    //if gyro hardware exists
    if(motionManager.isGyroAvailable){
        if(motionManager.isGyroActive){
            [motionManager setGyroUpdateInterval:.1];
            [motionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
                //If need to store accelerometer
                //NSString *x = [[NSString alloc]initWithFormat:@"%.02f",gyroData.rotationRate.z];
            }];
        }
        //if in simulator
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"NO GYRO" message:@"GET A GYRO" delegate:self cancelButtonTitle:@"DONE" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)read{
    CMAttitude *attitude;
    CMDeviceMotion *motion = motionManager.deviceMotion;
    attitude = motion.attitude;
    
    
    //float storeYaw;
    //NSLog(@"Yaw is %f",attitude.yaw);
    [currentSet setGyroX:((float)attitude.pitch)];
    [currentSet setGyroY:((float)attitude.yaw)];
    [currentSet setGyroZ:((float)attitude.roll)];
    

    //float storeYaw = attitude.yaw;

    
}


-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    
    //NSLog(@"X: %g,Y: %g,Z: %g",acceleration.x,acceleration.y,acceleration.z);
    
    /*======NOTES=======
     ACCEL
     FACEDOWN(0,0,1)
     FACEUP(0,0,-1)
     FACEFORWARD(0,-1,0)
     
     GYRO (rad/s)
     1st Roll
     2nd Pitch
     3rd Yaw
     + Y to left, - Y to right, .3 threshold
     
     Graph
     Functions
     0th y=x+1
     1st y=x+.6
     2nd y=x+.2
     3rd y=x-.2
     4th y=x-.6
     5th y=x-1
     
     object to contain UIImage and respective Gyro, Accel data
     Gyro = set to 0 at
     =====END NOTES====
     */
    
    
    /*====Version.01 BASIC FUNCTIONALITY====
     if( (acceleration.y > -.1 && acceleration.y < .1) && (acceleration.z > .9)){NSLog(@"FACEDOWN!");}
     if( (acceleration.y > -.1 && acceleration.y < .1) && (acceleration.z < -.9)){NSLog(@"FACEUP!");}
     if( (acceleration.z > -.1 && acceleration.z < .1) && (acceleration.y < -.9)){NSLog(@"FACEFORWARD!");}
     
     //Determine quadrant
     if(acceleration.y < 0 && acceleration.z < 0){quadrant = 3;}
     else if(acceleration.y < 0 && acceleration.z > 0){quadrant = 4;}
     ====END BASIC FUNCTIONALITY====
     */
    
    //obtain Y value and update Label
    //[currentSet setAccelY:([self calcLine:(0):(acceleration.x):(acceleration.y):(acceleration.z)])];
    [currentSet setAccelY:(acceleration.y)];
    [currentSet setAccelX:(acceleration.x)];
    [currentSet setAccelZ:(acceleration.z)];
    [currentSet printNormalized];
    //int yValue = [self calcLine:(0):(acceleration.x):(acceleration.y):(acceleration.z)];
    //NSLog(@"Y:%i",yValue);
    //========>accelNow = yValue;
    //========>XLabel.text = [NSString stringWithFormat:@"Y:%i", yValue];
    
    
}

- (int)calcLine:(int)lineNum:(float)accelx:(float)accely:(float)accelz {
    int closestLine; 
    float calcTemp1 = 1;
    float calcTemp2 = -1;
    float calcTemp3 = 1-.4*lineNum;
    float distance;
    float top = 10;
    closestLine = 0;
    
    if(accelz<=0){
        for(int i = 0;i<6;i++){
            calcTemp3 = 1-.4*i;
            distance = ( calcTemp1 * accelz + calcTemp2 * accely + calcTemp3)/1.4142135;
            if(fabs(distance)<top && distance >=0){closestLine = i;top=fabs(distance);}
            else if(fabs(distance)<top && distance <0){closestLine = i-1;top=fabs(distance);}
            
            //if(closestLine = -1){closestLine=0;}
        }
    }
    else{
        calcTemp1=-1;
        for(int i = 0;i<6;i++){
            calcTemp3 = 1-.4*i;
            distance = ( calcTemp1 * accelz + calcTemp2 * accely + calcTemp3)/1.4142135;
            if(fabs(distance)<top && distance >=0){closestLine = i;top=fabs(distance);}
            else if(fabs(distance)<top && distance <0){closestLine = i-1;top=fabs(distance);}
            
            //if(closestLine = -1){closestLine=0;}
        }
        closestLine=-closestLine+9;
        
    }
    return closestLine+1;
}



@end
