//
//  AMBGameViewController.m
//  A-Maze-Balls
//
//  Created by Matthew Hallatt on 05/10/2014.
//  Copyright (c) 2014 Gift Games. All rights reserved.
//

#import "AMBGameViewController.h"
#import "AMBWallGeneratingView.h"
#import "AMBBall.h"

@interface AMBGameViewController ()

@property (nonatomic, assign) BOOL shouldUpdateBallPosition;

@property (nonatomic, strong) AMBWallGeneratingView *wallGeneratingView;
@property (nonatomic, strong) AMBBall *ball;

@end

@implementation AMBGameViewController

#pragma mark - Setup Methods

- (void)setup
{
  [super setup];
  
  [self setShouldUpdateBallPosition:false];
  
  [self setupWallGeneratingView];
  [self setupBall];
}

- (void)setupWallGeneratingView
{
  self.wallGeneratingView = [[AMBWallGeneratingView alloc] initWithFrame:self.view.bounds];
  [self.view addSubview:self.wallGeneratingView];
}

- (void)setupBall
{
  self.ball = [[AMBBall alloc] initWithCentrePoint:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height - 100.0f)
                                            radius:40.0f];
  [self.ball setBackgroundColor:[UIColor blackColor]];
  [self.view addSubview:self.ball];
}

#pragma mark - Touch Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  [super touchesBegan:touches withEvent:event];
  
  UITouch *newTouch = [touches anyObject];
  
  if([self.ball pointInside:[newTouch locationInView:self.view] withEvent:event])
  {
    [self setShouldUpdateBallPosition:true];
  }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
  [super touchesMoved:touches withEvent:event];
  
  UITouch *updatingTouch = [touches anyObject];
  CGPoint touchLocation = [updatingTouch locationInView:self.view];
  
  if(self.shouldUpdateBallPosition)
  {
    //TODO: Modify touchLocation here to take offset of finger from centre of ball in to account
    [self.ball setCenter:touchLocation];
  }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  [super touchesEnded:touches withEvent:event];
  
  [self setShouldUpdateBallPosition:false];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
  [super touchesCancelled:touches withEvent:event];
  
  [self setShouldUpdateBallPosition:false];
}

#pragma mark - View Controller Presentation Methods

- (BOOL)prefersStatusBarHidden
{
  return true;
}

@end
