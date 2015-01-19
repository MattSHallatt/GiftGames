//
//  AMBGameViewController.m
//  A-Maze-Balls
//
//  Created by Matthew Hallatt on 05/10/2014.
//  Copyright (c) 2014 Gift Games. All rights reserved.
//

#import "AMBGameViewController.h"
#import "AMBWallGeneratingView.h"

@interface AMBGameViewController ()

@property (nonatomic, strong) AMBWallGeneratingView *wallGeneratingView;

@end

@implementation AMBGameViewController

- (void)setup
{
  [super setup];
  [self setupWallGeneratingView];
}

- (void)setupWallGeneratingView
{
  self.wallGeneratingView = [[AMBWallGeneratingView alloc] initWithFrame:self.view.bounds];
  [self.view addSubview:self.wallGeneratingView];
}

- (BOOL)prefersStatusBarHidden
{
  return true;
}

@end
