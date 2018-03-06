//
//  MVVM_SampleUITests.m
//  MVVM SampleUITests
//
//  Created by Fahad Naeem on 2/7/18.
//  Copyright © 2018 Fahad Naeem. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface MVVM_SampleUITests : XCTestCase

@end

@implementation MVVM_SampleUITests

- (void)setUp
{
    [super setUp];
    
    self.continueAfterFailure = NO;
    
    [[[XCUIApplication alloc] init] launch];
}


- (void)tearDown
{
    [super tearDown];
    
//    self.mainView = nil;
}

- (void)testSwipeTable
{
    XCUIElementQuery *tablesCellQuery = [[XCUIApplication alloc] init].tables;
    XCUIElement * cell = [tablesCellQuery.cells elementBoundByIndex:(tablesCellQuery.cells.count - 1)];
    if (cell)
    {
        [cell tap];
    }
    
    XCUIElementQuery *tablesQuery = [[XCUIApplication alloc] init].tables;
    XCUIElement* table = tablesQuery.element;
    [table swipeUp];
}

-(void)testAddingNewTask
{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"ADD NEW TASK"] tap];
    
    XCUIElement *element = [[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"AddNewTaskView"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    XCUIElement *textField = [element childrenMatchingType:XCUIElementTypeTextField].element;
    [textField tap];
    [textField typeText:@"111111"];
    
    XCUIElement *textView = [element childrenMatchingType:XCUIElementTypeTextView].element;
    [textView tap];
    [textView tap];
    [textView typeText:@"22222222"];
    [app.buttons[@"ADD"] tap];
    
    XCUIElementQuery *tablesCellQuery = [[XCUIApplication alloc] init].tables;
    XCUIElement * cell = [tablesCellQuery.cells elementBoundByIndex:(tablesCellQuery.cells.count - 1)];
    if (cell)
    {
        [cell tap];
    }
}

@end
