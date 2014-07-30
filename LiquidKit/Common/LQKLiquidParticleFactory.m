//
//  MXLiquidParticleFactory.m
//  LiquidKit
//
//  Created by Kevin Hartman on 2/1/14.
//  Copyright (c) 2014 Kevin Hartman (kevin@hart.mn), Joshua Pueschel (joshuapueschel@gmail.com),
//  Andrew Landman (anl8094@rit.edu).
//
//  Licensed under the MIT license.
//

#import "LQKLiquidParticleFactory.h"
#import "LQKImageUtils.h"

@implementation LQKLiquidParticleFactory

/* Constants */

/* The current CI liquid filter algorithm uses a white circle and colors */
/* the parent liquid by mapping white to the liquid's desired color.     */
const CGFloat CIRCLE_COLOR[] = { 1.0f, 1.0f, 1.0f, 1.0f };

- (id) initWithRadius:(CGFloat)radius {
    
    if (self = [super init]) {
        
        XXImage *image = [LQKImageUtils imageWithSize:CGSizeMake(radius * 2, radius * 2) fromContextDrawBlock:^(CGContextRef context){
            
            CGMutablePathRef circlePath = CGPathCreateMutable();
            CGPathAddArc(circlePath, NULL, radius, radius, radius, 0, M_PI*2, NO);
            
            CGContextSetFillColor(context, CIRCLE_COLOR);
            CGContextAddPath(context, circlePath);
            CGContextFillPath(context);
            CGPathRelease(circlePath);
            
        }];
        
        self.circleRadius = radius;
        self.circleTexture = [SKTexture textureWithImage:image];
        
    }
    return self;
}

- (SKNode*) createLiquidParticle {
    
    SKSpriteNode *circleNode = [[SKSpriteNode alloc] init];
    
    /* Attach sprite */
    circleNode.texture = self.circleTexture;
    circleNode.size = CGSizeMake(self.circleRadius * 2, self.circleRadius * 2);
    circleNode.anchorPoint = CGPointMake(0.5,0.5);
    
    /* Attach physics body */
    circleNode.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.circleRadius];
    circleNode.physicsBody.dynamic = YES;
    circleNode.physicsBody.categoryBitMask = 3;
    circleNode.physicsBody.contactTestBitMask = 4;
    circleNode.physicsBody.collisionBitMask = -1;
    circleNode.physicsBody.usesPreciseCollisionDetection = NO;
    circleNode.physicsBody.mass = 10;
    circleNode.physicsBody.friction = 0;
    circleNode.physicsBody.restitution = 0.1;
    
    
    return circleNode;
}

@end
