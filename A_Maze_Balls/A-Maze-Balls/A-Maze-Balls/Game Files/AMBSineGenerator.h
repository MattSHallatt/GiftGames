//
//  AMBSineGenerator.h
//  A-Maze-Balls
//
//  Created by Matthew Hallatt on 18/01/2015.
//  Copyright (c) 2015 Gift Games. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^callbackBlock)(float sine);

@interface AMBSineGenerator : NSObject

@property (nonatomic, strong) callbackBlock listener;

@property (nonatomic, assign) int upperBound;

- (void)setActive:(BOOL)active;

@end
