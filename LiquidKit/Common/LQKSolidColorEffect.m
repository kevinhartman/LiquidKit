//
//  LQKSolidColorEffect.m
//  LiquidKit
//
//  Created by Kevin Hartman on 7/28/14.
//  Copyright (c) 2014 Kevin Hartman. All rights reserved.
//

#import "LQKSolidColorEffect.h"

@implementation LQKSolidColorEffect

- (id) initWithColor:(XXColor*)color withIndex:(CGFloat)index withWidth:(CGFloat)width {
    if (self = [super init]) {
        
        if (!color) {
            return nil;
        }
        
        self.color = color;
        self.index = index;
        self.width = width;
    }
    
    return self;
}

- (CIImage *) thresholdGradient {
    
    /* Create index-length opaque strip */
    CIFilter *backgroundColorFilter = [CIFilter filterWithName:@"CIConstantColorGenerator"];
    [backgroundColorFilter setValue:[CIColor colorWithRed:0 green:0 blue:0 alpha:1] forKey:@"inputColor"];
    
    CIImage *infiniteBackgroundImage = [backgroundColorFilter valueForKey: kCIOutputImageKey];
    CIImage *backgroundImage = [infiniteBackgroundImage imageByCroppingToRect:CGRectMake(0, 0, self.index, 1)];
    
    /* Create width-length white strip */
    CIFilter *foregroundColorFilter = [CIFilter filterWithName:@"CIConstantColorGenerator"];
    [foregroundColorFilter setValue:[CIColor colorWithRed:1 green:1 blue:1 alpha:1] forKey:@"inputColor"];
    
    CIImage *infiniteForegroundFImage = [foregroundColorFilter valueForKey: kCIOutputImageKey];
    CIImage *foregroundImage = [infiniteForegroundFImage imageByCroppingToRect:CGRectMake(0, 0, self.width, 1)];
    
    /* Source out composite opaque strip from white-strip, resulting in 0 to index-length transparency */
    CIFilter *compositeFilter = [CIFilter filterWithName:@"CISourceOutCompositing"];
    [compositeFilter setValue:backgroundImage forKey:@"inputBackgroundImage"];
    [compositeFilter setValue: foregroundImage forKey: kCIInputImageKey];
    
    CIImage *baseGradient = [compositeFilter valueForKey: kCIOutputImageKey];
    
    /* Adjust a transparent and white gradient to be transparent and <color> */
    CIFilter *gradientColorAdjust = [CIFilter filterWithName:@"CIWhitePointAdjust"];
    [gradientColorAdjust setValue:baseGradient forKey:kCIInputImageKey];
    [gradientColorAdjust setValue:[CIColor colorWithCGColor:self.color.CGColor] forKey:@"inputColor"];
    
    CIImage *coloredGradientImage = [gradientColorAdjust valueForKey: kCIOutputImageKey];
    
    return coloredGradientImage;

}

- (CIImage *) postProcessedFrameFrom:(CIImage *)input {
    return input;
}

@end
