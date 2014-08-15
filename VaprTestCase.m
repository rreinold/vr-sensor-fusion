//
//  VaprTestCase.m
//  VaprVideoV1
//
//  Created by Robert Reinold on 8/7/14.
//  Copyright (c) 2014 Robert Reinold. All rights reserved.
//

#import "VaprTestCase.h"
#import "Vapr.h"

@implementation VaprTestCase

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBasic{
    NSMutableArray* testArray = [[NSMutableArray alloc] init];
    [testArray addObject:[[sensorSet alloc] initWithNormalizedData:13:2 :3 :4 :5 :6 :7 :8]];
    Vapr* Vapr = [Vapr  initWithData:testArray];
    sensorSet* getThis = [[sensorSet alloc] init];

    BOOL frameNumBool = ([getThis getFrameNum] == 13);
    
    
    
    STAssertTrue(frameNumBool,@"hey");
}



@end
