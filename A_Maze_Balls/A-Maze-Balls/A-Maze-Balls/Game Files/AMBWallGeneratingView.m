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
@property (nonatomic, strong) AMBWallSegment *wallSegment;

@end

@implementation AMBWallGeneratingView

- (void)setup
{
  [super setup];
  [self setupSineGenerator];
}

- (void)setupSineGenerator
{
  self.sineGenerator = [[AMBSineGenerator alloc] init];
  [self.sineGenerator setActive:true];
  
  __weak AMBWallGeneratingView *weakSelf = self;
  [self.sineGenerator setListener:^(float sineValue) {
    [weakSelf.wallSegment removeFromSuperview];
    weakSelf.wallSegment = [[AMBWallSegment alloc] initWithFrame:CGRectMake(0.0f, 0.0f, weakSelf.frame.size.width, 20.0f)
                                                             gap:250.0f
                                                          offset:(sineValue * weakSelf.frame.size.width/10)];
    [weakSelf addSubview:weakSelf.wallSegment];
  }];
}

@end
