//
//  MyAccountController_V1UITestsLaunchTests.m
//  MyAccountController-V1UITests
//
//  Created by Theo on 2024/7/30.
//

#import <XCTest/XCTest.h>

@interface MyAccountController_V1UITestsLaunchTests : XCTestCase

@end

@implementation MyAccountController_V1UITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
