//
//  LQKLiquidEffect.h
//  LiquidKit
//
//  Created by Kevin Hartman on 7/28/14.
//  Copyright (c) 2014 Kevin Hartman. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LQKImageUtils.h"

@protocol LQKLiquidEffect<NSObject>

- (CIImage *) thresholdGradient;

- (CIImage *) postProcessedFrameFrom:(CIImage *)input;

@end
