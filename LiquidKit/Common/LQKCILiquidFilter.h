//
//  MXCILiquidFilter.h
//  LiquidKit
//
//  Created by Kevin Hartman on 2/1/14.
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

@interface LQKCILiquidFilter: CIFilter {
    CIImage *inputImage;
}

@property (retain, nonatomic) CIImage *inputImage;

@property CIFilter *threshFilter;
@property CIFilter *compositeFilter;
@property CIFilter *blurFilter;
@property CIImage *backgroundColor;

@property CGFloat blurRadius;

- (id) initWithBlurRadius:(CGFloat)blurRadius withGradientImage:(CIImage*)inputGradientImage;

@end

