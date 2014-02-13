//
//  LQImageUtils+OSXUtils.m
//  LiquidKit
//
//  Created by Kevin Hartman on 2/12/14.
//  Copyright (c) 2014 Kevin Hartman. All rights reserved.
//

#import "LQImageUtils+OSXUtils.h"

@implementation LQImageUtils (OSXUtils)

+ (NSImage *) imageWithSize:(CGSize)size fromContextDrawBlock:(void (^) (CGContextRef))drawBlock {
    
    NSImage *im = [[NSImage alloc] initWithSize:size];
    NSBitmapImageRep *rep = [[NSBitmapImageRep alloc]
                             initWithBitmapDataPlanes:NULL
                             pixelsWide:size.width
                             pixelsHigh:size.height
                             bitsPerSample:8
                             samplesPerPixel:4
                             hasAlpha:YES
                             isPlanar:NO
                             colorSpaceName:NSCalibratedRGBColorSpace
                             bytesPerRow:0
                             bitsPerPixel:0];
    
    [im addRepresentation:rep];
    
    [im lockFocus];
    
    CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
    
    drawBlock(ctx);
    
    [im unlockFocus];
    
    return im;

}

@end
