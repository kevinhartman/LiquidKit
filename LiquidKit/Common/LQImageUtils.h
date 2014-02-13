//
//  LQImageUtils.h
//  LiquidKit
//
//  Created by Kevin Hartman on 2/12/14.
//  Copyright (c) 2014 Kevin Hartman. All rights reserved.
//

@interface LQImageUtils : NSObject

@end

/* Attach platform specific utilities */
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#import "LQImageUtils+iOSUtils.h"
typedef UIImage XXImage;
#else
#import <AppKit/AppKit.h>
#import "LQImageUtils+OSXUtils.h"
typedef NSImage XXImage;
#endif