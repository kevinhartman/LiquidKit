//
//  MXCILiquidFilter.h
//  LiquidKit
//
//  Created by Kevin Hartman on 2/1/14.
//  Copyright (c) 2014 Hackathon. All rights reserved.
//
#if TARGET_OS_IPHONE
#import <CoreImage/CoreImage.h>
#else
#import <QuartzCore/CoreImage.h>
#endif

@interface MXCILiquidFilter: CIFilter {
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

