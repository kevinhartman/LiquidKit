//
//  MXLiquidParticleFactory.h
//  LiquidKit
//
//  Created by Kevin Hartman on 2/1/14.
//  Copyright (c) 2014 Kevin Hartman (kevin@hart.mn), Joshua Pueschel (joshuapueschel@gmail.com),
//  Andrew Landman (anl8094@rit.edu).
//
//  Licensed under the MIT license.
//

#import <SpriteKit/SpriteKit.h>

@interface LQKLiquidParticleFactory : NSObject

/* Constants */
extern const CGFloat CIRCLE_COLOR[];

/* Properties */
@property CGFloat circleRadius;
@property SKTexture *circleTexture;

/* Instance methods */
- (id) initWithRadius:(CGFloat)radius;

- (SKNode*) createLiquidParticle;

@end
