//
//  AMBGameViewController.m
//  A-Maze-Balls
//
//  Created by Matthew Hallatt on 05/10/2014.
//  Copyright (c) 2014 Gift Games. All rights reserved.
//

#import "AMBGameViewController.h"
#import "AMBSineGenerator.h"

@interface AMBGameViewController ()

@property (nonatomic, strong) AMBSineGenerator *sineGenerator;

@end

@implementation AMBGameViewController

- (void)setup
{
  [super setup];
  [self setupSineGenerator];
}

- (void)setupSineGenerator
{
  self.sineGenerator = [[AMBSineGenerator alloc] init];
  [self.sineGenerator setActive:true];
  [self.sineGenerator setListener:^(float sineValue) {
    NSLog(@"%f", sineValue);
  }];
}

@end
