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

- (id) initWithBlurRadius:(NSInteger)radius withLiquidFilter:(CIFilter *)filter {
    
    if (self = [super init]) {
        
        
        // TODO: This class will contain the logic associated with grouping child nodes
        // together and rasterizing those groups individually for opimization
        
        
        
        /* effect node properties */
        self.filter = filter;
        self.shouldRasterize = NO;
        self.shouldEnableEffects = YES;
        self.physicsBody.usesPreciseCollisionDetection= NO;
        self.shouldCenterFilter = YES;
        
    }
    return self;
}

@end
