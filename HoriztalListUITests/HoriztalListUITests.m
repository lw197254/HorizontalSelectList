//
//  HoriztalListUITests.m
//  HoriztalListUITests
//
//  Created by 刘伟 on 2017/8/3.
//  Copyright © 2017年 万圣伟业. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HoriztalListUITests : XCTestCase
@property(nonatomic,strong)XCUIApplication*app;
@end

@implementation HoriztalListUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    self.app = [[XCUIApplication alloc]init];
    [self.app launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}				

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
//-(void)testGame{
//
//    self.app = [[XCUIApplication alloc]init];
//
//    XCUIApplication *app = [[XCUIApplication alloc] init];
//    XCUIElementQuery *collectionViewsQuery = app.collectionViews;
//    XCUIElement *ab1Button = collectionViewsQuery.cells.buttons[@"ab我是第1个"];
//    [ab1Button tap];
//
//    XCUIElementQuery *tablesQuery = app.tables;
//    [tablesQuery.cells.staticTexts[@"你好呀，我真的不知道怎么回事"] tap];
//
//    /*@START_MENU_TOKEN@*/[ab1Button pressForDuration:0.6];/*[["ab1Button","["," tap];"," pressForDuration:0.6];"],[[[-1,0,1]],[[1,3],[1,2]]],[0,0]]@END_MENU_TOKEN@*/
//
//
//}
- (void)testExample {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *collectionViewsQuery = app.collectionViews;
    [collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons[@"ab0"]/*[[".cells.buttons[@\"ab0\"]",".buttons[@\"ab0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons[@"ab1"]/*[[".cells.buttons[@\"ab1\"]",".buttons[@\"ab1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons[@"ab2"]/*[[".cells.buttons[@\"ab2\"]",".buttons[@\"ab2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons[@"ab3"]/*[[".cells.buttons[@\"ab3\"]",".buttons[@\"ab3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeCollectionView].element swipeLeft];
    [collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons[@"ab8"]/*[[".cells.buttons[@\"ab8\"]",".buttons[@\"ab8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    
    XCUIElementQuery *tablesQuery = app.tables;
    [tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"abcabcabcabcabc"]/*[[".cells.staticTexts[@\"abcabcabcabcabc\"]",".staticTexts[@\"abcabcabcabcabc\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ swipeUp];
    [tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"abcabcabcabcabcabcabcabc"]/*[[".cells.staticTexts[@\"abcabcabcabcabcabcabcabc\"]",".staticTexts[@\"abcabcabcabcabcabcabcabc\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"abcabcabcabc"]/*[[".cells.staticTexts[@\"abcabcabcabc\"]",".staticTexts[@\"abcabcabcabc\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"abcabcabc"]/*[[".cells.staticTexts[@\"abcabcabc\"]",".staticTexts[@\"abcabcabc\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"abcabcabcabcabcabcabc"]/*[[".cells.staticTexts[@\"abcabcabcabcabcabcabc\"]",".staticTexts[@\"abcabcabcabcabcabcabc\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
        
//    XCUIElementQuery *collectionViewsQuery = [[XCUIApplication alloc] init].collectionViews;
//    for (NSInteger i = 0; i < 10; i++) {
//        [collectionViewsQuery.cells.buttons[@"ab我是第1个"] tap];
//        [collectionViewsQuery.cells.buttons[@"ab我是第3个"] tap];
//        [collectionViewsQuery.cells.buttons[@"ab我是第2个"] tap];
//    }
//
    
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
