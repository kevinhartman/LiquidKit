//
//  LQImageUtils+iOSUtils.m
//  LiquidKit
//
//  Created by Kevin Hartman on 2/12/14.
//  Copyright (c) 2014 Kevin Hartman. All rights reserved.
//

#import "LQImageUtils+iOSUtils.h"


@implementation LQImageUtils (iOSUtils)

+ (UIImage *) imageWithSize:(CGSize)size fromContextDrawBlock:(void (^) (CGContextRef))drawBlock {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:circlePath];
//    
//    [[UIColor whiteColor] setStroke];
//    [[UIColor whiteColor] setFill];
//    [path stroke];
//    [path fill];
    
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    drawBlock(ctx);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
