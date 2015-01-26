//
//  AMBBall.m
//  A-Maze-Balls
//
//  Created by Matthew Hallatt on 25/01/2015.
//  Copyright (c) 2015 Gift Games. All rights reserved.
//

#import "AMBBall.h"

@interface AMBBall ()

@property (nonatomic, assign) float radius;

@end

@implementation AMBBall

- (id)initWithCentrePoint:(CGPoint)centrePoint radius:(float)radius
{
  _radius = radius;
  return [super initWithFrame:CGRectMake(centrePoint.x - radius,
                                         centrePoint.y - radius,
                                         radius*2,
                                         radius*2)];
}

- (void)setup
{
  [super setup];
  [self.layer setCornerRadius:self.radius];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
  float deltaX = point.x - self.center.x;
  float deltaY = point.y - self.center.y;
  
  float distance = sqrtf(powf(deltaX, 2) + pow(deltaY, 2));
  
  return distance <= self.radius;
}

@end
