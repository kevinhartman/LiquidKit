//
//  LQImageUtils.h
//  LiquidKit
//
//  Created by Kevin Hartman on 2/12/14.
//  Copyright (c) 2014 Kevin Hartman (kevin@hart.mn), Joshua Pueschel (joshuapueschel@gmail.com),
//  Andrew Landman (anl8094@rit.edu).
//
//  Licensed under the MIT license.
//

#if TARGET_OS_IPHONE
#import <CoreImage/CoreImage.h>
#else
#import <QuartzCore/CoreImage.h>
#endif

@interface LQKImageUtils : NSObject

+ (CIImage *) thresholdGradientWithIndex:(CGFloat)index withWidth:(CGFloat)width;

@end

/* Attach platform specific utilities */
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#import "LQKImageUtils+iOSUtils.h"
typedef UIImage XXImage;
typedef UIColor XXColor;
#else
#import <AppKit/AppKit.h>
#import "LQKImageUtils+OSXUtils.h"
typedef NSImage XXImage;
typedef NSColor XXColor;
#endif