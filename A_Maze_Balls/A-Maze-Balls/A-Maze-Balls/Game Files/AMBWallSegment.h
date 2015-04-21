//
//  AMBWallSegment.h
//  A-Maze-Balls
//
//  Created by Matthew Hallatt on 19/01/2015.
//  Copyright (c) 2015 Gift Games. All rights reserved.
//

#import "AMBView.h"
#import "AMBBall.h"

@interface AMBWallSegment : AMBView

@property (nonatomic, assign) float gap;
@property (nonatomic, assign) float offset;

- (id)initWithFrame:(CGRect)frame gap:(float)gap offset:(float)offset;

- (BOOL)isCollidingWithFrame:(CGRect)incomingFrame;
- (BOOL)isCollidingWithBall:(AMBBall *)ball;

@end
