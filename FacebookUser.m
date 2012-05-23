//
//  FacebookUser.m
//  Social
//
//  Created by Yash Thakar on 5/7/12.
//  Copyright (c) 2012 New York University. All rights reserved.
//

#import "FacebookUser.h"

@implementation FacebookUser
@synthesize userName;
@synthesize userImageUrl;
@synthesize userId;
-(FacebookUser *) initWithId:(NSString *)_userId userName:(NSString *)_username
{
    userId=_userId;
    userName=_username;
    userImageUrl=nil;
    return self;
}

@end
