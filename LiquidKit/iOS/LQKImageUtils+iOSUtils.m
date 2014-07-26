//
//  LQImageUtils+iOSUtils.m
//  LiquidKit
//
//  Created by Kevin Hartman on 2/12/14.
//  Copyright (c) 2014 Kevin Hartman (kevin@hart.mn), Joshua Pueschel (joshuapueschel@gmail.com),
//  Andrew Landman (anl8094@rit.edu).
//
//  Licensed under the MIT license.
//

#import "LQKImageUtils+iOSUtils.h"

@implementation LQKImageUtils (iOSUtils)

+ (UIImage *) imageWithSize:(CGSize)size fromContextDrawBlock:(void (^) (CGContextRef))drawBlock {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    drawBlock(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
