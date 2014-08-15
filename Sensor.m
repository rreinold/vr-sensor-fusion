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
int accelxNormal,accelyNormal,accelzNormal,gyroxNormal,gyroyNormal,gyrozNormal,teslaNormal;
//TODO: Multiple inits
- (id)init{
    self = [super init];
    //NSLog(@"Accelerometer Frequency: %@",requestedFreq);
    [self initialize];
    [self initTesla];
    currentSet = [[sensorSet alloc] init];
    return self;
}

- (id)initWithData:(int)requestedFreq{
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
    
    teslaNormal = (int) ((newHeading.magneticHeading)*1000/359);
    [currentSet setTesla:teslaNormal];
    //NSLog(@"Tesla: %u",[currentSet getTesla]);
    
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
    //int gyroxNormal,gyroyNormal,gyrozNormal;

    gyroxNormal = (int) ((attitude.pitch+3.14)*1000/6.28);
    gyroyNormal = (int) ((attitude.yaw+3.14)*1000/6.28);
    gyrozNormal = (int) ((attitude.roll+3.14)*1000/6.28);

    
    [currentSet setGyroX:(gyroxNormal)];
    [currentSet setGyroY:gyroyNormal];
    [currentSet setGyroZ:(gyrozNormal)];
    //NSLog(@"Gyro X is %u ",[currentSet getGyroX]);
    //NSLog(@"Gyro X is %u ",[currentSet getGyroY]);
    //NSLog(@"Gyro X is %u ",[currentSet getGyroZ]);
    

    //float storeYaw = attitude.yaw;

    
}

- (sensorSet*)getSensorSet{
    //[currentSet printRaw];
    //NSLog(@"currentSet gyro is %u",[currentSet getGyroX]);
    sensorSet* toReturn = [[sensorSet alloc] init];
    [toReturn setGyroX:(gyroxNormal)];
    [toReturn setGyroY:gyroyNormal];
    [toReturn setGyroZ:(gyrozNormal)];
    [toReturn setAccelY:(accelxNormal)];
    [toReturn setAccelX:(accelyNormal)];
    [toReturn setAccelZ:(accelzNormal)];
    [toReturn setTesla:teslaNormal];
    [toReturn printRaw];
    return currentSet;
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    
         
    
    //obtain Y value and update Label
    //int accelxNormal,accelyNormal,accelzNormal;
    accelxNormal = (int) ((acceleration.x+8)*1000/16);
    accelyNormal = (int) ((acceleration.y+8)*1000/16);
    accelzNormal = (int) ((acceleration.z+8)*1000/16);
    
    
    [currentSet setAccelY:(accelxNormal)];
    [currentSet setAccelX:(accelyNormal)];
    [currentSet setAccelZ:(accelzNormal)];
    
    //NSLog(@"Accel X is %u ",[currentSet getAccelX]);
    //NSLog(@"Accel X is %u ",[currentSet getAccelY]);
    //NSLog(@"Accel X is %u ",[currentSet getAccelZ]);
    
    //[currentSet printNormalized];
    //int yValue = [self calcLine:(0):(acceleration.x):(acceleration.y):(acceleration.z)];
    //NSLog(@"Y:%i",yValue);
    //========>accelNow = yValue;
    //========>XLabel.text = [NSString stringWithFormat:@"Y:%i", yValue];
    
    
}




@end

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
