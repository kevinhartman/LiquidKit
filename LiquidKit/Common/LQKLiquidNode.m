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

/*
 * Compute the sections that the liquid effect should blur
 */
- (void) update {
    
    //TODO: double-check boundary conds
    
    /* prepare buffer */
    CGRect *currentRect = [((LQKCILiquidFilter *)[self filter]) prepareRectBufferWithSlots:[[self children] count]];
    
    /* return if there's nothing to process */
    if ([[self children] count] == 0) {
        return;
    }
    
    /* wrap children with optimized linked list */
    LinkedList *children = [[LinkedList alloc] initWithArray:[self children]];

    /* initialize the group rect with some first node */
    *currentRect = [[children removeHead] frame];
    
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
            currentRect++;
            *currentRect = [[children removeHead] frame];
            continue;
        }
        
        /* the new group is is smallest rectangle containing the old group and the new neighbor */
        *currentRect = CGRectUnion(*currentRect, [groupNeighbor frame]);
    }
}

@end
