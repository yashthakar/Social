//
//  FacebookDelegate.m
//  Social
//
//  Created by Yash Thakar
//  Copyright (c) 2012 New York University. All rights reserved.
//

#import "SHFBDelegate.h"


@implementation SHFBDelegate

@synthesize facebook = _facebook;
@synthesize appId = _appId;
@synthesize delegate = _delegate;

-(BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
  return [self.facebook handleOpenURL:url];
}

-(void)fbDidLogin
{
  NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
  [defaults setObject:[self.facebook accessToken] forKey:@"FBAccessTokenKey"];
  [defaults setObject:[self.facebook expirationDate] forKey:@"FBExpirationDateKey"];
  [defaults synchronize];
}

-(void)fbDidLogout
{
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  if ([defaults objectForKey:@"FBAccessTokenKey"]) {
    [defaults removeObjectForKey:@"FBAccessTokenKey"];
    [defaults removeObjectForKey:@"FBExpirationDateKey"];
    [defaults synchronize];
  }

}

-(void)request:(FBRequest *)request didLoad:(id)result
{
  NSLog(@"URL: %@",[request url]);
    NSLog(@"Result: %@",result);
  //NSArray *chunks = [[request url] componentsSeparatedByString: @"/"];
  //NSLog(@"array: %@",chunks);
  NSRange range = [[request url] rangeOfString:@"me"];
  NSLog(@"location: %d, length: %d",range.location,range.length);
  NSString* relativeUrl = [[request url] substringFromIndex:range.location+range.length+1];
    NSLog(@"URL: %@",relativeUrl);
  [self->_facebookResponseHandler notifyForRequest:relativeUrl WithResponse:result];
}

-(void)request:(FBRequest *)request didReceiveResponse:(NSURLResponse *)response
{
  //NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*) response;
  //NSLog(@"Status Code: %d",[httpResponse statusCode]);
  //NSLog(@"Headers: %@",[httpResponse allHeaderFields]);
}

-(void)request:(FBRequest *)request didFailWithError:(NSError *)error
{
  NSLog(@"Error: %@",[error userInfo]);
}

-(SHFBDelegate*)initWithAppdId:(NSString *)appId andDelegate:(id<SHFBRequestDelegate>)delegate
{
  self = [super init];
  if(self != nil){
    self.appId = appId;
    self.delegate = delegate;
    self->_facebookResponseHandler = [[SHFBResponseHandlers alloc] initWithDelegate:delegate];
  }
  return self;
}

-(NSString*)getUserProfilePic:(NSString*) userId
{
    NSLog(@"Getting profile pic for userId: %@",userId);
    NSString* path = [NSString stringWithFormat:@"%@?fields=picture",userId];
    [self.facebook requestWithGraphPath:path andDelegate:self];
}

-(void) getUserStatus
{
  NSLog(@"access_token: %@",[self.facebook accessToken]);
  NSLog(@"expiration date: %@",[self.facebook expirationDate]);
  [self.facebook requestWithGraphPath:@"me" andDelegate:self];
}

-(void) initFacebook{
  self.facebook = [[Facebook alloc] initWithAppId:self.appId];
  self.facebook.sessionDelegate = self;
}

-(void) openFacebookDialogWithPermissions:(NSString*)permissions
{
  NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
  [dict setObject:self.appId forKey:@"client_id"];
  [dict setObject:permissions forKey:@"scope"];
  [self.facebook dialog:@"oauth"andParams:dict andDelegate:self];
}

-(void) get:(int)N UpdatesForFriendWithId:(NSString *)friendId
{
}

-(void) getFriendList
{
  [self.facebook requestWithGraphPath:@"me/friends" andDelegate:self];
}

-(void) openFacebook
{
  NSLog(@"Done configuring facebook");
  NSLog(@"AppDelegate: opening facebook");
  NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
  if(self.facebook == nil ||
     [defaults objectForKey:ACCESS_TOKEN] == nil ||
     [defaults objectForKey:EXPIRATION_DATE] == nil)
  {
    [self initFacebook];
  }
  else
  {
    self.facebook.accessToken = [defaults objectForKey:ACCESS_TOKEN];
    self.facebook.expirationDate = [defaults objectForKey:EXPIRATION_DATE];
  }
  NSString* permissions = [NSString stringWithFormat:@"user_status,user_about_me, user_checkins,\
                           user_likes,user_photos,user_notes,user_location,user_checkins, \
                           read_stream, email, read_stream, user_birthday, \
                           user_about_me, publish_stream, offline_access, friends_likes,\
                           friends_events, friends_birthday,friends_groups,friends_location,\
                           friends_status,friends_photos,read_friendlists,read_insights"];
  
  [self openFacebookDialogWithPermissions:permissions];
}

@end
