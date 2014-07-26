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

@interface LQKLiquidNode : SKEffectNode


- (id) initWithColor:(XXColor*)color
       withThreshold:(NSInteger)index
       withGradientWidth:(NSInteger)width
       withBlurRadius:(NSInteger)radius;

@end
