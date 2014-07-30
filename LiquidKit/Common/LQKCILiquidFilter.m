//
//  MXCILiquidFilter.m
//  LiquidKit
//
//  Created by Kevin Hartman on 2/1/14.
//  Copyright (c) 2014 Kevin Hartman (kevin@hart.mn), Joshua Pueschel (joshuapueschel@gmail.com),
//  Andrew Landman (anl8094@rit.edu).
//
//  Licensed under the MIT license.
//

#import "LQKCILiquidFilter.h"

#define GEN_COLOR_PADDING 12

@implementation LQKCILiquidFilter

@synthesize inputImage;


- (id) initWithBlurRadius:(CGFloat)blurRadius withLiquidEffect:(NSObject<LQKLiquidEffect>*)liquidEffect {
    if (self = [super init]) {
        
        CIImage *inputGradientImage = nil;
        
        if (!(inputGradientImage = [liquidEffect thresholdGradient])) {
            return nil;
        }
        
        self.blurRadius = blurRadius;
        self.liquidEffect = liquidEffect;
        
        self.threshFilter = [CIFilter filterWithName:@"CIColorMap" keysAndValues:@"inputGradientImage", inputGradientImage, nil];
        
        /* Create background filter */
        CIFilter *backgroundColorFilter = [CIFilter filterWithName:@"CIConstantColorGenerator"];
        [backgroundColorFilter setValue:[CIColor colorWithRed:0 green:0 blue:0 alpha:1] forKey:@"inputColor"];
        
        /* Create image from background filter */
        self.backgroundColor = [backgroundColorFilter valueForKey: kCIOutputImageKey];
        
        /* Create composite filter */
        self.compositeFilter = [CIFilter filterWithName:@"CISourceOverCompositing"];
        
        /* Create blur */
        self.blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
        [self.blurFilter setDefaults];
        [self.blurFilter setValue:[NSNumber numberWithInteger:self.blurRadius] forKey:@"inputRadius"];
        
    }
    
    return self;
}

- (CIImage *) outputImage {
    
    /* ColorMap only maps non-alpha colors, so a background is needed */
    /* The color is padded to be a bit larger than the source image */
    /* so that the gaussian blur has data to blur at the very edges of the source image */
    CIImage *croppedColor = [self.backgroundColor
                             imageByCroppingToRect:CGRectMake(
                                                              self.inputImage.extent.origin.x - GEN_COLOR_PADDING - self.blurRadius,
                                                              self.inputImage.extent.origin.y - GEN_COLOR_PADDING - self.blurRadius,
                                                              self.inputImage.extent.size.width + ((GEN_COLOR_PADDING + self.blurRadius) * 2),
                                                              self.inputImage.extent.size.height + ((GEN_COLOR_PADDING + self.blurRadius) * 2)
                                                              )
                             ];
    
    [self.compositeFilter setValue:croppedColor forKey:@"inputBackgroundImage"];
    
    /* Composite input with background */
    [self.compositeFilter setValue: self.inputImage forKey: kCIInputImageKey];
    CIImage *backgroundedImage = [self.compositeFilter valueForKey: kCIOutputImageKey];


    // TODO: allow blur radius to be passed in
    [self.blurFilter setValue:backgroundedImage forKey:kCIInputImageKey];
    
    CIImage *blurredImage = [self.blurFilter valueForKey: kCIOutputImageKey];

    /* Apply threshold */
    [self.threshFilter setValue:blurredImage forKey:kCIInputImageKey];
    
    CIImage *liquidImage = [self.threshFilter valueForKey: kCIOutputImageKey];
    
    return [self.liquidEffect postProcessedFrameFrom:liquidImage];
}

@end
