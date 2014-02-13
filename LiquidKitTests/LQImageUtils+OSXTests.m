//
//  LiquidKitTests.m
//  LiquidKitTests
//
//  Created by Kevin Hartman on 2/6/14.
//  Copyright (c) 2014 Kevin Hartman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LQImageUtils+OSXUtils.h"

@interface LiquidKitTests : XCTestCase

@end

@implementation LiquidKitTests

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
