//
//  LQImageUtils.m
//  LiquidKit
//
//  Created by Kevin Hartman on 2/12/14.
//  Copyright (c) 2014 Kevin Hartman (kevin@hart.mn), Joshua Pueschel (joshuapueschel@gmail.com),
//  Andrew Landman (anl8094@rit.edu).
//
//  Licensed under the MIT license.
//

#import "LQKImageUtils.h"

@implementation LQKImageUtils

+ (CIImage *) thresholdGradientWithIndex:(CGFloat)index withWidth:(CGFloat)width {
    
    /* Create index-length opaque strip */
    CIFilter *backgroundColorFilter = [CIFilter filterWithName:@"CIConstantColorGenerator"];
    [backgroundColorFilter setValue:[CIColor colorWithRed:0 green:0 blue:0 alpha:1] forKey:@"inputColor"];
    
    CIImage *infiniteBackgroundImage = [backgroundColorFilter valueForKey: kCIOutputImageKey];
    CIImage *backgroundImage = [infiniteBackgroundImage imageByCroppingToRect:CGRectMake(0, 0, index, 1)];
    
    /* Create width-length white strip */
    CIFilter *foregroundColorFilter = [CIFilter filterWithName:@"CIConstantColorGenerator"];
    [foregroundColorFilter setValue:[CIColor colorWithRed:1 green:1 blue:1 alpha:1] forKey:@"inputColor"];
    
    CIImage *infiniteForegroundFImage = [foregroundColorFilter valueForKey: kCIOutputImageKey];
    CIImage *foregroundImage = [infiniteForegroundFImage imageByCroppingToRect:CGRectMake(0, 0, width, 1)];
    
    /* Source out composite opaque strip from white-strip, resulting in 0 to index-length transparency */
    CIFilter *compositeFilter = [CIFilter filterWithName:@"CISourceOutCompositing"];
    [compositeFilter setValue:backgroundImage forKey:@"inputBackgroundImage"];
    [compositeFilter setValue: foregroundImage forKey: kCIInputImageKey];
    
    
    CIImage *finalGradient = [compositeFilter valueForKey: kCIOutputImageKey];
    
    return finalGradient;
}

@end
