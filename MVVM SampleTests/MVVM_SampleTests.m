//
//  MVVM_SampleTests.m
//  MVVM SampleTests
//
//  Created by Fahad Naeem on 2/7/18.
//  Copyright © 2018 Fahad Naeem. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MainViewModel.h"
#import "AddNewTaskViewModel.h"

@interface MVVM_SampleTests : XCTestCase

@property (strong , nonatomic) AddNewTaskViewModel * addViewModel;

@end

@implementation MVVM_SampleTests

- (void)setUp
{
    [super setUp];
    
    _addViewModel = [[AddNewTaskViewModel alloc]init];
}

- (void)tearDown
{
    [super tearDown];
    
    _addViewModel = nil;
}

- (void)testOldSavedTasks
{
    NSMutableArray *OLDTASKS = [self.addViewModel GetOldSavedTasks];

    XCTAssertNotNil(OLDTASKS , @"ARRAY IS NIL");
}

-(void)testSaveNewTask
{
    XCTAssertTrue([self.addViewModel SaveNewTask:@"Test Title" andDesc:@"Unit testing of apps"],@"Unable to add new task");
}

@end
