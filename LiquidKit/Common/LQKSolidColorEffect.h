//
//  LQKSolidColorEffect.h
//  LiquidKit
//
//  Created by Kevin Hartman on 7/28/14.
//  Copyright (c) 2014 Kevin Hartman. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LQKLiquidEffect.h"

@interface LQKSolidColorEffect : NSObject<LQKLiquidEffect>

/* Properties */
@property XXColor* color;
@property CGFloat index;
@property CGFloat width;

- (id) initWithColor:(XXColor*)color withIndex:(CGFloat)index withWidth:(CGFloat)width;

- (CIImage *) thresholdGradient;

- (CIImage *) postProcessedFrameFrom:(CIImage *)input;

@end
