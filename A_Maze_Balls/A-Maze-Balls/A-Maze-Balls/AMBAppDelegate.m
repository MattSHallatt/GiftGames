//
//  AMBAppDelegate.m
//  A-Maze-Balls
//
//  Created by Matthew Hallatt on 05/10/2014.
//  Copyright (c) 2014 Gift Games. All rights reserved.
//

#import "AMBAppDelegate.h"
#import "AMBHomeViewController.h"

@implementation AMBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  AMBHomeViewController *homeVC = [[AMBHomeViewController alloc] initWithNibName:@"HomeViewController" bundle:[NSBundle mainBundle]];
  UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:homeVC];
  [self.window setRootViewController:navController];
  [self.window makeKeyAndVisible];
  return YES;
}

@end
