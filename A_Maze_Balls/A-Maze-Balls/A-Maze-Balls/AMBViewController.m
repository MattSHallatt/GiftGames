//
//  AMBViewController.m
//  A-Maze-Balls
//
//  Created by Matthew Hallatt on 05/10/2014.
//  Copyright (c) 2014 Gift Games. All rights reserved.
//

#import "AMBViewController.h"

@interface AMBViewController ()

@end

@implementation AMBViewController

#pragma mark - View Lifecycle Methods

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self setup];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  [self update];
  [self enableNotifications:true];
}

- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
  [self enableNotifications:false];
  [self dismiss];
}

#pragma mark - Setup Methods

- (void)setup
{
  
}

#pragma mark - Update Methods

- (void)update
{
  
}

#pragma mark - Notification Methods

- (void)enableNotifications:(BOOL)enabled
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
  
  if(enabled)
  {
    [self notifications];
  }
}

- (void)notifications
{
  
}

#pragma mark - Dismissal Methods

- (void)dismiss
{
  
}

@end
