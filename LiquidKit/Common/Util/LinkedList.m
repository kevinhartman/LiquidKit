//
//  LinkedList.m
//  LiquidKit
//
//  Created by Kevin Hartman on 8/1/14.
//  Copyright (c) 2014 Kevin Hartman (kevin@hart.mn).
//
//  Licensed under the MIT license.
//

#import "LinkedList.h"

@implementation LinkedList


- (id) initWithArray:(NSArray *)input {
    
    if (self = [super init]) {
        _data = input;
        _list = malloc(sizeof(Element) * [input count]);
        _head = _list;
        
        [input enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            _list[idx].reference = obj;
            _list[idx].next = (idx == [input count] - 1) ? NULL : &_list[idx + 1];
            
        }];
    }
    
    return self;
}

- (id) remove:(BOOL (^) (id obj, NSUInteger idx))condition {
    
    NSUInteger index = 0;
    
    Element *iter = _head;
    Element *prev = NULL;
    
    while (iter) {
        
        if (condition(iter->reference, index)) {
            
            id reference = iter->reference;
            
            if (index == 0) {
                _head = iter->next;
                return reference;
            }
            
            prev->next = iter->next;
            return reference;
        }
        
        index++;
        prev = iter;
        iter = iter->next;
    }
    
    return nil;
}

-(void)dealloc {
    free(_list);
}


@end
