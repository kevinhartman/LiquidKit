LiquidKit
=========

A small library for creating liquid for use with SpriteKit on iOS and OS X.

![alt text](https://raw.githubusercontent.com/kevinhartman/LiquidKit/master/screenshot.png)

Purpose
=======
This library is a good option for people who are using SpriteKit on iOS and want to have a small amount of liquid simulation going on in their scene. It's not a fast implementation, because it's implemented using a combination of several CoreImage filters (but there is still some room for optimization :) ). On iOS, it's not currently possible to implement your own custom CIFilter (which would be much more efficient than this implementation), but SpriteKit effects must be CIFilters.

The library is also an option on OS X for people who are using SpriteKit and do not want to implement a customer CIFilter.

Status
======
* Capable of creating 2D liquids for use in SpriteKit.
* Liquids can only be a solid color. You should be able to apply a texture of some sort by writing a custom threshold gradient generator, and/or by compositing the output of the liquid filter with some sort of texture. The library does not support doing these things for you currently and you'd need to recompile it with those changes. I'll probably make the library more robust and allow it to accept user overrides in both of these places at some point.
* Currently, the liquid effect is applied to the entire area encompassed by the LiquidNode (including empty space). In SpriteKit, an EffectNode's effect is applied to the smallest rectangle that can be drawn to encompass all of it's children. This means that if you have a single liquid particle in each corner of the screen, the filter algorithm will run for the entire screen, even though there isn't much liquid to affect. This can be optimized by only running the filter on clumps of nodes that are close enough for their blurs to interact (including single nodes). I might get around to this.

Known Issues
============
* Designating a liquid to be white causes it to be black.
* The more space between the LiquidNode's children, the slower the simulation will be. This could be optimized as noted in Status.
* If any nodes (liquid particles or other nodes you want the effect applied to) fall off of the screen, your simulation will lag and SpriteKit will delete the entire LiquidNode in protest. This stems from the above issue. You should probably be deleting liquid particles after a certain amount of time (seconds), which should solve the problem for most.

Usage
=====
The following code sample shows the process of creating a liquid using LiquidKit. In this example, <i>liquidNode</i> can be added to a SpriteKit scene to display the liquid.


`````objective-c
#import <LiquidKit/LiquidKit.h>
...

  /* Create a liquid with desired visual tuning *.
  SKNode *liquidNode = [[LQKLiquidNode alloc ] initWithColor:[NSColor magentaColor] withThreshold:100 withGradientWidth:256 withBlurRadius:30];
  
  /* Create a particle factory that can produce optimized particles of a given size */
  LQKLiquidParticleFactory *liquidParticleFactory = [[LQKLiquidParticleFactory alloc] initWithRadius:15];
  
  /* Spawn a single bead of liquid */
  SKNode *particleNode = [liquidParticleFactory createLiquidParticle];
  particleNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
  particleNode.physicsBody.density = 50;
  
  /* Add the particle to the liquid so it will adopt its visual properties */
  [liquidNode addChild:particleNode];

...

`````

