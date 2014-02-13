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
    
    NSImage *image = [[NSImage alloc] initWithSize:size];
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
    
    [image addRepresentation:rep];
    
    [image lockFocus];
    
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    
    drawBlock(context);
    
    [image unlockFocus];
    
    return image;

}

@end
