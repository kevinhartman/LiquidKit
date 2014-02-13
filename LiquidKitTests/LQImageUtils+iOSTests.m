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
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddArc(circlePath, NULL, 0, 0, 6, 0, M_PI*2, NO);
    //CGPathRelease(circlePath);
    
    [LQImageUtils testClassMethod];
    
    [LQImageUtils testCategoryMethod];
    
    [LQImageUtils imageWithSize:CGSizeMake(12, 12) fromContextDrawBlock:^(CGContextRef context){
        
        CGContextAddPath(context, circlePath);
        CGContextStrokePath(context);
        
    }];
}

@end
