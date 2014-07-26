//
//  MXLiquidNode.m
//  Mixer
//
//  Created by Kevin Hartman on 1/30/14.
//  Copyright (c) 2014 Kevin Hartman (kevin@hart.mn), Joshua Pueschel (joshuapueschel@gmail.com),
//  Andrew Landman (anl8094@rit.edu).
//
//  Licensed under the MIT license.
//

#import "LQKLiquidNode.h"
#import "LQKCILiquidFilter.h"

@implementation LQKLiquidNode

- (id) initWithColor:(XXColor*)color
       withThreshold:(NSInteger)index
       withGradientWidth:(NSInteger)width
       withBlurRadius:(NSInteger)radius {
    
    if (self = [super init]) {
        
        CIImage *inputGradientImage = [LQKImageUtils thresholdGradientWithIndex:index withWidth:width];
        
        /* Adjust a transparent and white gradient to be transparent and <color> */
        CIFilter *gradientColorAdjust = [CIFilter filterWithName:@"CIWhitePointAdjust"];
        [gradientColorAdjust setValue:inputGradientImage forKey:kCIInputImageKey];
        [gradientColorAdjust setValue:[CIColor colorWithCGColor:color.CGColor] forKey:@"inputColor"];
        
        CIImage *coloredGradientImage = [gradientColorAdjust valueForKey: kCIOutputImageKey];
        
        /* effect node properties */
        self.filter = [[LQKCILiquidFilter alloc]
                       initWithBlurRadius:radius
                       withGradientImage:coloredGradientImage];
        
        self.shouldRasterize = NO;
        self.shouldEnableEffects = YES;
        self.physicsBody.usesPreciseCollisionDetection= NO;
        self.shouldCenterFilter = YES;
        
    }
    return self;
}

@end
