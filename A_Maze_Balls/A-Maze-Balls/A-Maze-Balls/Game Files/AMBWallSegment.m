//
//  AMBWallSegment.m
//  A-Maze-Balls
//
//  Created by Matthew Hallatt on 19/01/2015.
//  Copyright (c) 2015 Gift Games. All rights reserved.
//

#import "AMBWallSegment.h"

@interface AMBWallSegment ()

@property (nonatomic, assign) float gap;
@property (nonatomic, assign) float offset;

@property (nonatomic, strong) UIView *leftWall;
@property (nonatomic, strong) UIView *rightWall;

@end

@implementation AMBWallSegment

- (id)initWithFrame:(CGRect)frame gap:(float)gap offset:(float)offset
{
  _gap = gap;
  _offset = offset;
  return [super initWithFrame:frame];
}

- (void)setup
{
  [super setup];
  [self setupLeftWall];
  [self setupRightWall];
}

- (void)setupLeftWall
{
  float width = (self.frame.size.width - self.gap)/2;
  self.leftWall = [[UIView alloc] initWithFrame:CGRectMake(0.0f,
                                                           0.0f,
                                                           width + self.offset,
                                                           self.frame.size.height)];
  [self.leftWall setBackgroundColor:[UIColor redColor]];
  [self addSubview:self.leftWall];
}

- (void)setupRightWall
{
  float width = (self.frame.size.width - self.gap)/2;
  self.rightWall = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width - width + self.offset,
                                                            0.0f,
                                                            width - self.offset,
                                                            self.frame.size.height)];
  [self.rightWall setBackgroundColor:[UIColor redColor]];
  [self addSubview:self.rightWall];
}

@end
