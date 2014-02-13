//
//  LQImageUtils+OSXUtils.h
//  LiquidKit
//
//  Created by Kevin Hartman on 2/12/14.
//  Copyright (c) 2014 Kevin Hartman. All rights reserved.
//

#import "LQImageUtils.h"
#import <AppKit/AppKit.h>

@interface LQImageUtils (OSXUtils)

+ (NSImage *) imageWithSize:(CGSize)size fromContextDrawBlock:(void (^) (CGContextRef))drawBlock;

@end
