//
//  tableViewDemoTests.m
//  tableViewDemoTests
//
//  Created by wipro on 18/05/18.
//  Copyright © 2018 wipro. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NetworkAPIManager.h"
#import "ViewController.h"
#import "ItemCell.h"


@interface tableViewDemoTests : XCTestCase

@property (nonatomic, strong) ViewController *viewController;

@end

@implementation tableViewDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    window.rootViewController = navController;
    window.backgroundColor = [UIColor whiteColor];
    [window makeKeyAndVisible];
    
    [self.viewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    [self.viewController viewDidAppear:NO];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [NetworkAPIManager fetchData:^(NSDictionary *result, NSError *error) {
        // add white bg color for tableview display
        
        XCTAssertNotNil(result, @"response is not nil");
        //  XCTAssertTrue(error == nil, @"No error");
        
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testTableViewCellCellReuseIdentifier
{
    ItemCell *cell = (ItemCell *)[self.viewController tableView:self.viewController.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    NSString *reuseIdentifier = @"ItemCell";
    XCTAssertTrue([cell.reuseIdentifier isEqualToString:reuseIdentifier], @"Table does not create reusable cells");
}

- (void)testViewConformsToUITableViewDataSource
{
    XCTAssertTrue([self.viewController conformsToProtocol:@protocol(UITableViewDataSource) ], @"View does not conform to UITableView datasource protocol");
}

- (void)testTableViewHasDataSource
{
    XCTAssertNotNil(self.viewController.tableView.dataSource, @"Table datasource cannot be nil");
}

- (void)testViewConformsToUITableViewDelegate
{
    XCTAssertTrue([self.viewController conformsToProtocol:@protocol(UITableViewDelegate) ], @"View does not conform to UITableView delegate protocol");
}

- (void)testTableViewIsConnectedToDelegate
{
    XCTAssertNotNil(self.viewController.tableView.delegate, @"Table delegate cannot be nil");
}

@end
