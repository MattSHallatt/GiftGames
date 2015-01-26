//
//  AMBSineGenerator.m
//  A-Maze-Balls
//
//  Created by Matthew Hallatt on 18/01/2015.
//  Copyright (c) 2015 Gift Games. All rights reserved.
//

#import "AMBSineGenerator.h"

#define DEG_2_RAD(x) (x*M_PI)/180.0f
#define UPPER_LIMIT 360

@interface AMBSineGenerator ()

@property (nonatomic, assign) float index;

@property (nonatomic, strong) NSTimer *updateTimer;

@end

@implementation AMBSineGenerator

- (instancetype)init
{
  //TODO: Find a way to calculate this initial offset
  _index = UPPER_LIMIT*0.43;
  return [super init];
}

- (void)setActive:(BOOL)active
{
  if(self.active == active)
  {
    return;
  }
  
  _active = active;
  
  if(active)
  {
    self.updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(updateSine) userInfo:nil repeats:true];
  }
  else
  {
    [self.updateTimer invalidate];
    self.updateTimer = nil;
  }
}

- (void)updateSine
{
  if(self.index > UPPER_LIMIT)
  {
    self.index = 0;
  }
  else
  {
    self.index++;
  }
  
  if(self.listener && self.listener != nil)
  {
    self.listener(sinf(DEG_2_RAD(self.index)));
  }
}

@end
