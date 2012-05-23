//
//  FacebookResponseHandlers.h
//  Social
//
//  Created by Yash Thakar
//  Copyright (c) 2012 New York University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHFBRequestDelegate.h"

@interface SHFBResponseHandlers : NSObject
{
  NSMutableDictionary* requests;
  id<SHFBRequestDelegate> _delegate;
}

-(void)addRequest:(NSString*)request withSelector:(NSString*)selector;
-(SHFBResponseHandlers*) initWithDelegate:(id<SHFBRequestDelegate>)delegate;
-(void)notifyForRequest:(NSString*)request WithResponse:(NSDictionary *)response;

@end

@interface SHFBResponseHandlers (Hidden)

-(void)removeServedRequest;
@end
