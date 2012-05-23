//
//  Util.m
//  Social
//
//  Created by Akash Mehra on 4/12/12.
//  Copyright (c) 2012 New York University. All rights reserved.
//

#import "SHUtil.h"
#import <QuartzCore/QuartzCore.h>

@implementation SHUtil

+(void) configureComponent:(UIView*)component
{
  component.layer.cornerRadius = 0;
  component.layer.masksToBounds = NO;
  component.layer.borderColor = [UIColor colorWithRed:1 
                                  green:1 blue:1 alpha:0.5].CGColor;
  component.layer.shadowRadius = 10.0;
  component.layer.shadowOffset = CGSizeMake(8.0, 6.0);
  component.layer.shadowOpacity = 1;
  component.layer.shadowColor = [UIColor blackColor].CGColor;
  component.layer.shadowPath = [UIBezierPath bezierPathWithRect:component.bounds].CGPath;
}

@end
