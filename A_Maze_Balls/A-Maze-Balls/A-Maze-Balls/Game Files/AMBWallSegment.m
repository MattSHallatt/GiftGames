//
//  AMBWallSegment.m
//  A-Maze-Balls
//
//  Created by Matthew Hallatt on 19/01/2015.
//  Copyright (c) 2015 Gift Games. All rights reserved.
//

#import "AMBWallSegment.h"

@interface AMBWallSegment ()

@property (nonatomic, strong) UIView *leftWall;
@property (nonatomic, strong) UIView *rightWall;

@end

@implementation AMBWallSegment

#pragma mark - Initialisation Methods

- (id)initWithFrame:(CGRect)frame gap:(float)gap offset:(float)offset
{
  _gap = gap;
  _offset = offset;
  return [super initWithFrame:frame];
}

#pragma mark - Setup Methods

- (void)setup
{
  [super setup];
  
  [self setUserInteractionEnabled:false];
  
  [self setupLeftWall];
  [self setupRightWall];
  [self updateWalls];
}

- (void)setupLeftWall
{
  self.leftWall = [[UIView alloc] init];
  [self.leftWall setBackgroundColor:[UIColor redColor]];
  [self addSubview:self.leftWall];
}

- (void)setupRightWall
{
  self.rightWall = [[UIView alloc] init];
  [self.rightWall setBackgroundColor:[UIColor redColor]];
  [self addSubview:self.rightWall];
}

#pragma mark - Setter Methods

- (void)setGap:(float)gap
{
  _gap = gap;
  [self updateWalls];
}

- (void)setOffset:(float)offset
{
  _offset = offset;
  [self updateWalls];
}

#pragma mark - Update Methods

- (void)updateWalls
{
  [self updateLeftWall];
  [self updateRightWall];
}

- (void)updateLeftWall
{
  float width = (self.frame.size.width - self.gap)/2;
  [self.leftWall setFrame:CGRectMake(0.0f,
                                     0.0f,
                                     width + self.offset,
                                     self.frame.size.height)];
}

- (void)updateRightWall
{
  float width = (self.frame.size.width - self.gap)/2;
  [self.rightWall setFrame:CGRectMake(self.frame.size.width - width + self.offset,
                                      0.0f,
                                      width - self.offset,
                                      self.frame.size.height)];
}

#pragma mark - Collision Methods

- (BOOL)isCollidingWithFrame:(CGRect)incomingFrame
{
  return (CGRectIntersectsRect(incomingFrame, CGRectMake(self.leftWall.frame.origin.x,
                                                         self.frame.origin.y,
                                                         self.leftWall.frame.size.width,
                                                         self.leftWall.frame.size.height)) ||
          CGRectIntersectsRect(incomingFrame, CGRectMake(self.rightWall.frame.origin.x,
                                                         self.frame.origin.y,
                                                         self.rightWall.frame.size.width,
                                                         self.rightWall.frame.size.height)));
}

- (BOOL)isCollidingWithBall:(AMBBall *)ball
{
  if([self isCollidingWithFrame:ball.frame])
  {
    //TODO: Implement more detailed collision detection here
    return true;
  }
  
  return false;
}

@end
