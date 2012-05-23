//
//  FBDelegate.h
//  Social
//
//  Created by Yash Thakar
//  Copyright (c) 2012 New York University. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SHFBRequestDelegate <NSObject>

-(void)responseReceived:(NSDictionary*)response;

@end

