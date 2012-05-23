//
//  TileAppDelegate.h
//  Social
//
//  Created by Yash Thakar
//  Copyright (c) 2012 New York University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"
#import "SHViewController.h"

@interface SHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UIViewController *viewController;

@property (nonatomic, retain) Facebook* facebook;


@end
