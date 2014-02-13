//
//  MXLiquidParticleFactory.h
//  LiquidKit
//
//  Created by Kevin Hartman on 2/1/14.
//  Copyright (c) 2014 Hackathon. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MXLiquidParticleFactory : NSObject

@property CGFloat circleRadius;
@property SKTexture *circleTexture;

- (id) initWithRadius:(CGFloat)radius;

- (SKNode*) createLiquidParticle;

@end
