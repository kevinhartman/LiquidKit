LiquidKit
=========

A small library for creating liquid for use with SpriteKit on iOS and OS X.

![alt text](https://raw.githubusercontent.com/kevinhartman/LiquidKit/master/screenshot.png)

Purpose
=======
This library is a good option for people who are using SpriteKit on iOS and want to have a small amount of liquid simulation going on in their scene. It's not a fast implementation, because it's implemented using a combination of several built-in CoreImage filters (the only option for SpriteKit on iOS, because SpriteKit effect filters must be CIFilters, and on iOS, it's not currently possible to implement a custom  low-level CIFilter).

The library is also an option on OS X for people who are using SpriteKit and do not want to implement a custom low-level CIFilter.

Status
======
* Capable of creating 2D liquids for use in SpriteKit.
* Currently, the liquid effect is applied to the entire area encompassed by the LiquidNode (including empty space). In SpriteKit, an EffectNode's effect is applied to the smallest rectangle that can be drawn to encompass all of it's children. This means that if you have a single liquid particle in each corner of the screen, the filter algorithm will run for the entire screen, even though there isn't much liquid to affect. This can be optimized by only running the filter on clumps of nodes that are close enough for their blurs to interact (including single nodes). This is currently in progress.

Known Issues
============
* LQKSolidColorEffect: Designating a liquid to be white causes it to be black.
* The more space between the LiquidNode's children, the slower the simulation will be. This could be optimized as noted in Status.
* If any nodes (liquid particles or other nodes you want the effect applied to) fall off of the screen, your simulation will lag and SpriteKit will delete the entire LiquidNode in protest. This stems from the above issue. You should probably be deleting liquid particles after a certain amount of time (seconds), which should solve the problem for most.

Usage
=====
The following code sample shows the process of creating a liquid using LiquidKit. In this example, <i>liquidNode</i> can be added to a SpriteKit scene to display the liquid.


`````objective-c
#import <LiquidKit/LiquidKit.h>
...

  /* Create a texturing strategy for the liquid -- built-in, or on your own */
  LQKSolidColorEffect *solidEffect = [[LQKSolidColorEffect alloc] initWithColor:[NSColor magentaColor] withIndex:100 withWidth:256];
  
  /* Create a liquid filter with the liquid texturing effect */
  LQKCILiquidFilter *filter = [[LQKCILiquidFilter alloc] initWithBlurRadius:30 withLiquidEffect:solidEffect];
  
  /* Create a liquid node with the liquid filter */
  SKNode *liquidNode = [[LQKLiquidNode alloc] initWithBlurRadius:30 withLiquidFilter:filter];
  
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

Downloading
===========
Master is not stable. Go to the release tag and download the relevant files for whichever release you're into.
