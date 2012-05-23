//
//  FacebookDelegate.h
//  Social
//
//  Created by Yash Thakar
//  Copyright (c) 2012 New York University. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FBConnect.h"
#import "SHFBResponseHandlers.h"


/*constants for access_token and expiration_date*/
#define ACCESS_TOKEN @"FBAccessTokenKey"
#define EXPIRATION_DATE @"FBExpirationDateKey"

/*For future support to handle errors on receiving response and notify controller about them.*/
enum SHFBDelegateStatusCode
{
  SHFBDELEGATE_SUCCESS,
  SHFBDELEGATE_FAILURE
};

/*Wrapper for Facebook API calls.
 *Accepts a delegate (which gets notified by the handler once the response is received). 
 *This delegate is generally the controller for a view.
 *Composes a response handler which based on each based on the type of request performs
 *the selector.
 */

@interface SHFBDelegate : NSObject <FBSessionDelegate,FBDialogDelegate,FBLoginDialogDelegate,FBRequestDelegate>
{
  @private
    Facebook* _facebook;
    NSString* _appId;
    id<SHFBRequestDelegate> _delegate;
    SHFBResponseHandlers* _facebookResponseHandler;
}

@property (nonatomic,retain) Facebook* facebook;
@property (nonatomic,retain) NSString* appId;
@property (nonatomic, retain) id<SHFBRequestDelegate> delegate;

/*open facebook dialog with a call to private member function implemented by the hidden category*/
-(void)openFacebook;
/*a demo function to get the user's status, needs to be changed.*/
-(void)getUserStatus;
/*constructor*/
-(SHFBDelegate*)initWithAppdId:(NSString*)appId andDelegate:(id<SHFBRequestDelegate>)delegate;
/*initialize the facebook object with AppId and Delegate.*/
-(void)initFacebook;
/*get updates for N friends*/
-(void)get:(int)N UpdatesForFriendWithId:(NSString*)friendId;
/*get friendlist of all the friends.*/
-(void) getFriendList;
-(NSString*) getUserProfilePic:(NSString*) userId;

@end


/*a hidden category of type FacebookDelegate, declares the private methods for this class.*/
@interface SHFBDelegate (Hidden)

-(void) openFacebookDialogWithPermissions:(NSString*)permissions;

@end