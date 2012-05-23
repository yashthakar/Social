//
//  FacebookUser.h
//  Social
//
//  Created by Yash Thakar on 5/7/12.
//  Copyright (c) 2012 New York University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FacebookUser : NSObject
{
    NSString *userId;
    NSString *userName;
    NSString *userImageUrl;
}
@property (readwrite,assign) NSString *userId;
@property (readwrite,assign) NSString *userName;
@property (readwrite,assign) NSString *userImageUrl;

-(FacebookUser *) initWithId:(NSString *)_userId userName:(NSString *)username;



@end
