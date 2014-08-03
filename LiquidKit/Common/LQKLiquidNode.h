//
//  MXLiquidNode.h
//  Mixer
//
//  Created by Kevin Hartman on 1/30/14.
//  Copyright (c) 2014 Kevin Hartman (kevin@hart.mn), Joshua Pueschel (joshuapueschel@gmail.com),
//  Andrew Landman (anl8094@rit.edu).
//
//  Licensed under the MIT license.
//

#import <SpriteKit/SpriteKit.h>
#import "LQKImageUtils.h"
#import "LQKCILiquidFilter.h"

@interface LQKLiquidNode : SKEffectNode

@property NSInteger radius;

- (id) initWithBlurRadius:(NSInteger)radius withLiquidFilter:(LQKCILiquidFilter *)filter;

- (void) update;

@end
