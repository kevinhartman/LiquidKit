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
#import "LinkedList.h"

@implementation LQKLiquidNode

- (id) initWithBlurRadius:(NSInteger)radius withLiquidFilter:(LQKCILiquidFilter *)filter {
    
    if (self = [super init]) {
        
        self.radius = radius;
        
        /* effect node properties */
        self.filter = filter;
        self.shouldRasterize = NO;
        self.shouldEnableEffects = YES;
        self.physicsBody.usesPreciseCollisionDetection= NO;
        self.shouldCenterFilter = YES;
        
    }
    return self;
}

- (void) viewAdjust:(CGRect *) toConvert {
    // TODO: if scale is weird, calculate for point plus w & h
    CGPoint sceneCoord = [[self scene] convertPoint:toConvert->origin fromNode:self];
    sceneCoord = [[self scene] convertPointToView:sceneCoord];
    toConvert->origin = sceneCoord;
    
    CGPoint zero = CGPointMake(0, 0);
    
    /* what is the scene's origin in the view? */
    zero = [[self scene] convertPointToView:zero];
    
    
    
    
    
}

/*
 * Compute the sections that the liquid effect should blur
 */
- (void) update {
    
    //TODO: double-check boundary conds
    
    /* prepare buffer */
    RasterizeBuffer *buffer = [((LQKCILiquidFilter *)[self filter]) prepareRectBufferWithSlots:[[self children] count]];
    
    /* return if there's nothing to process */
    if ([[self children] count] == 0) {
        buffer->size = 0;
        return;
    }
    
    /* initialize write-head */
    CGRect *currentRect = buffer->buffer;
    NSUInteger count = 0;
    
    /* wrap children with optimized linked list */
    LinkedList *children = [[LinkedList alloc] initWithArray:[self children]];

    /* initialize the group rect with some first node */
    *currentRect = [[children removeHead] frame];
    count++;
    
    while (![children isEmpty]) {
        SKNode *groupNeighbor = [children remove:^BOOL(id candidate, NSUInteger idx) {
            CGRect neighborhood = CGRectMake(currentRect->origin.x - [self radius],
                                             currentRect->origin.y - [self radius],
                                             currentRect->size.width + [self radius],
                                             currentRect->size.height + [self radius]);
            
            /* if candidate node is close enough to roll with the crew */
            return CGRectIntersectsRect([candidate frame], neighborhood);
        }];
        
        /* if nobody is close, the group is complete */
        if (!groupNeighbor) {
            
            /* adjust the node's position to screen space */
            [self viewAdjust:currentRect];
            
            /* get the next solo node */
            SKNode *next = [children removeHead];
            
            /* initialize next group with a node if we aren't done */
            if (next) {
                currentRect++;
                *currentRect = [next frame];
                count++;
            }
            
            continue;
        }
        
        /* the new group is is smallest rectangle containing the old group and the new neighbor */
        *currentRect = CGRectUnion(*currentRect, [groupNeighbor frame]);
    }
    
    /* write the number of rectangles to expect */
    buffer->size = count;
    
}

@end
