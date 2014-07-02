@interface ViewController()

@property (retain, nonatomic) CLLocationManager *locationManager;
@property (retain, nonatomic) CLHeading *currentHeading;

@end

@implementation ViewController

- (void)viewDidLoad{
[super viewDidLoad];
self.currentHeading=[[CLHeading alloc] init];
self.locationManager = [[CLLocationManager alloc] init];
self.locationManager.desiredAccuracy = kCLLocationAcuracyBest;
self.locationManager.headingFilter = 1l
self.locationManager.delegate = self;
[self.locationManager startUpdatingHeading];
}

#pragma Location Manager Methods

- (void)locationManager:(CLLocationManager*)manager didUpdateHeading:(CLHeading*)newHeading{
self.currentHeading = newHeading;
//self.headingLabel.text = [NSString stringWithFormat:@"%d, (int)newHeading.magneticHeading];
}
- (BOOL)locationManagerShowShouldDisplayHeadingCalibration:)CLLocation Manager*)manager{
if(self.currentHeading == nil)
{
return YES;
}
else
{
return NO;
}
@end