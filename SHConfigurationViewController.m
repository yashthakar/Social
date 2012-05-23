//
//  TileViewController.m
//  Social
//
//  Created by Yash Thakar
//  Copyright (c) 2012 New York University. All rights reserved.
//

#import "SHConfigurationViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "FacebookUser.h"

@implementation SHConfigurationViewController

@synthesize facebook;

-(id)initConfigurationViewController
{
  self = [super initWithNibName:@"SHConfigurationViewController" bundle:nil];
  return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  NSString* appId = [NSString stringWithFormat:@"343267235721522"];
  shfbDelegate = [[SHFBDelegate alloc] initWithAppdId:appId andDelegate:self];
  [SHUtil configureComponent:buttonFacebookConfiguration];
  //SHUtil configureComponent:buttonTwitterConfiguration];
  //[SHUtil configureComponent:buttonGPlusConfiguration];
  //[SHUtil configureComponent:buttonTumblrConfiguration];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)responseReceived:(NSDictionary *)response
{
  NSDictionary* data = [response objectForKey:@"data"];
  /*for (NSDictionary* friend in data) 
  {
    NSLog(@"Id: %@, Name: %@",[friend objectForKey:@"id"],[friend objectForKey:@"name"]);
  }*/
  NSLog(@"Total Friends: %d",[data count]);
  //NSLog(@"response: %@",response);
  
}

-(void)printFriendList:(NSDictionary *)response
{
    NSDictionary* data = [response objectForKey:@"data"];
    //NSLog(@"%@",data);
    friendList=[[NSMutableArray alloc] init];
  for (NSDictionary* friend in data) 
  {
      
      FacebookUser *user=[[FacebookUser alloc] initWithId:[friend objectForKey:@"id"] userName:[friend objectForKey:@"name"]];
      [friendList addObject:user];
    //NSLog(@"Id: %@, Name: %@",[friend objectForKey:@"id"],[friend objectForKey:@"name"]);
  }
    
    for(int c=0;c<[friendList count];c++)
    {
        FacebookUser *user=[friendList objectAtIndex:c];
        NSString *url=[self getProfileUrlForUser:user.userId];
        user.userImageUrl=url;
    }   
    
    
 // NSLog(@"Total Friends: %d",[data count]);
}

-(NSString *) getProfileUrlForUser:(NSString *) userid
{
    NSString *url=[NSString stringWithFormat:@"temp String"];
    [shfbDelegate getUserProfilePic:userid];
    return  url;
}

-(IBAction)configureFacebook:(id)sender;
{
  NSLog(@"Controller: opening facebook");
  [shfbDelegate openFacebook];
}

-(IBAction)getStatus
{
  [shfbDelegate getUserStatus];
}

-(IBAction)friendList:(id)sender
{
  [shfbDelegate getFriendList];
}

@end
