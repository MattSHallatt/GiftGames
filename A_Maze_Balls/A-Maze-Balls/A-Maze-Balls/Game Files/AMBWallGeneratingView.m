//
//  AMBWallGeneratingView.m
//  A-Maze-Balls
//
//  Created by Matthew Hallatt on 19/01/2015.
//  Copyright (c) 2015 Gift Games. All rights reserved.
//

#import "AMBWallGeneratingView.h"
#import "AMBSineGenerator.h"
#import "AMBWallSegment.h"

@interface AMBWallGeneratingView ()

@property (nonatomic, strong) AMBSineGenerator *sineGenerator;
@property (nonatomic, strong) NSMutableArray *wallSegments;

@property (nonatomic, assign) BOOL hasPassedIntro;

@end

@implementation AMBWallGeneratingView

- (void)setup
{
  [super setup];
  
  [self setUserInteractionEnabled:false];
  
  [self setHasPassedIntro:false];
  
  [self setupWallSegments];
  [self setupSineGenerator];
}

- (void)setupWallSegments
{
  self.wallSegments = [[NSMutableArray alloc] init];
  
  for (int i = 0; i < self.frame.size.height; i++)
  {
    AMBWallSegment *segment = [[AMBWallSegment alloc] initWithFrame:CGRectMake(0.0f, -i, self.frame.size.width, 1.0f)
                                                                gap:150.0f
                                                             offset:0];
    [self.wallSegments addObject:segment];
    [self addSubview:segment];
  }
}

- (void)setupSineGenerator
{
  self.sineGenerator = [[AMBSineGenerator alloc] init];
  [self.sineGenerator setActive:true];
  
  __weak AMBWallGeneratingView *weakSelf = self;
  [self.sineGenerator setListener:^(float sineValue) {
    [weakSelf.wallSegments enumerateObjectsUsingBlock:^(AMBWallSegment *wallSegment, NSUInteger idx, BOOL *stop) {
      CGRect newWallSegmentFrame = wallSegment.frame;
      newWallSegmentFrame.origin.y++;
      
      if(newWallSegmentFrame.origin.y == weakSelf.frame.size.height)
      {
        newWallSegmentFrame.origin.y = 0;
        
        [weakSelf.wallSegments removeObject:wallSegment];
        [weakSelf.wallSegments insertObject:wallSegment atIndex:0];
        if(weakSelf.hasPassedIntro)
        {
          [wallSegment setOffset:(sineValue * weakSelf.frame.size.width/10)];
        }
        
        [weakSelf setHasPassedIntro:true];
      }
      
      [wallSegment setFrame:newWallSegmentFrame];
    }];
    [weakSelf checkCollisionWithBall:weakSelf.ball];
  }];
}

- (void)checkCollisionWithBall:(AMBBall *)ball
{
  __block BOOL isColliding = false;
  [self.wallSegments enumerateObjectsUsingBlock:^(AMBWallSegment *segment, NSUInteger idx, BOOL *stop) {
    isColliding = isColliding? : [segment isCollidingWithFrame:self.ball.frame];
    *stop = isColliding;
  }];
  [self.ball setBackgroundColor:isColliding? [UIColor magentaColor] : [UIColor blackColor]];
}

@end
