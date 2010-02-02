//
//  WordrXMLTableAppDelegate.m
//  WordrXMLTable
//
//  Created by Tim Duckett on 02/02/2010.
//  Copyright Charismatic Megafauna Ltd 2010. All rights reserved.
//

#import "WordrXMLTableAppDelegate.h"
#import "RootViewController.h"


@implementation WordrXMLTableAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

