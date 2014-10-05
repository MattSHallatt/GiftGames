//
//  AMBHomeViewController.m
//  A-Maze-Balls
//
//  Created by Matthew Hallatt on 05/10/2014.
//  Copyright (c) 2014 Gift Games. All rights reserved.
//

#import "AMBHomeViewController.h"
#import "AMBGameViewController.h"

@interface AMBHomeViewController ()

@end

@implementation AMBHomeViewController

- (void)setup
{
  [super setup];
}

#pragma mark - IBAction Methods

- (void)begin:(id)sender
{
  AMBGameViewController *gameVC = [[AMBGameViewController alloc] init];
  [self.navigationController pushViewController:gameVC animated:true];
}

@end
