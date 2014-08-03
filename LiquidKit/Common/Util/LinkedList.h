//
//  LinkedList.h
//  LiquidKit
//
//  Created by Kevin Hartman on 8/1/14.
//  Copyright (c) 2014 Kevin Hartman (kevin@hart.mn).
//
//  Licensed under the MIT license.
//

#import <Foundation/Foundation.h>

struct Element {
    __unsafe_unretained id reference;
    struct Element *next;
};
typedef struct Element Element;

@interface LinkedList : NSObject

@property NSArray *data;
@property Element *list;
@property Element *head;

- (id) initWithArray:(NSArray *)input;

- (id) remove:(BOOL (^) (id obj, NSUInteger idx))condition;

- (id) removeHead;

- (BOOL) isEmpty;

@end
