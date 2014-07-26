//
//  LQImageUtils+iOSUtils.h
//  LiquidKit
//
//  Created by Kevin Hartman on 2/12/14.
//  Copyright (c) 2014 Kevin Hartman (kevin@hart.mn), Joshua Pueschel (joshuapueschel@gmail.com),
//  Andrew Landman (anl8094@rit.edu).
//
//  Licensed under the MIT license.
//

#import "LQKImageUtils.h"

@interface LQKImageUtils (iOSUtils)

+ (UIImage *) imageWithSize:(CGSize)size fromContextDrawBlock:(void (^) (CGContextRef))drawBlock;

@end
