//
//  LQImageUtils+iOSTests.m
//  LiquidKit
//
//  Created by Kevin Hartman on 2/12/14.
//  Copyright (c) 2014 Kevin Hartman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>

#import "LQImageUtils+iOSUtils.h"

@interface LQImageUtils_iOSTests : XCTestCase

@end

@implementation LQImageUtils_iOSTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample
{
    CGFloat radius = 6.0f;
    
    [LQImageUtils imageWithSize:CGSizeMake(radius * 2, radius * 2) fromContextDrawBlock:^(CGContextRef context){
        
        CGFloat CIRCLE_COLOR[] = {1.0f, 1.0f, 1.0f, 1.0f};
        
        CGMutablePathRef circlePath = CGPathCreateMutable();
        CGPathAddArc(circlePath, NULL, radius, radius, radius, 0, M_PI*2, NO);
        
        CGContextSetFillColor(context, CIRCLE_COLOR);
        CGContextAddPath(context, circlePath);
        CGContextFillPath(context);
        CGPathRelease(circlePath);
        
    }];
}

@end
