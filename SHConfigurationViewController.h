//
//  TileViewController.h
//  Social
//
//  Created by Yash Thakar
//  Copyright (c) 2012 New York University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHAppDelegate.h"
#import "SHUtil.h"
#import "FBConnect.h"

#import "SHFBDelegate.h"

@interface SHConfigurationViewController : UIViewController <SHFBRequestDelegate>
{
  SHFBDelegate* shfbDelegate;
  
  IBOutlet UIButton* buttonFacebookConfiguration;
}

@property (nonatomic,retain) Facebook* facebook;

-(IBAction)configureFacebook:(id)sender;
-(IBAction)getStatus;

-(void) printFriendList:(NSDictionary*)response;
-(id)initConfigurationViewController;

@end
