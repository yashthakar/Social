//
//  FacebookResponseHandlers.m
//  Social
//
//  Created by Yash Thakar
//  Copyright (c) 2012 New York University. All rights reserved.
//

#import "SHFBResponseHandlers.h"

@implementation SHFBResponseHandlers

-(SHFBResponseHandlers*)initWithDelegate:(id<SHFBRequestDelegate>)delegate
{
  self = [super init];
  if(self != nil)
  {
    requests = [[NSMutableDictionary alloc] 
                initWithObjectsAndKeys:@"printFriendList:",@"friends", nil];
    self->_delegate = delegate;
  }
  return self;
}

-(void)addRequest:(NSString *)request withSelector:(NSString*)selector
{
  [requests setValue:selector forKey:request];
}

-(void)notifyForRequest:(NSString*)request WithResponse:(NSDictionary *)response
{
  NSString* selector = [requests objectForKey:request];
  [requests removeObjectForKey:request];
  [self->_delegate performSelector:NSSelectorFromString(selector) withObject:response];
}

-(void)removeServedRequest
{
  
}

@end
