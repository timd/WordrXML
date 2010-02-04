//
//  SecondLevelController.h
//  WordrXMLTable
//
//  Created by Tim Duckett on 04/02/2010.
//  Copyright 2010 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;


@interface SecondLevelController : UITableViewController {
		
	IBOutlet NSString *text;						// The update text itself
	IBOutlet NSString *user;						// who posted the update
	IBOutlet NSInteger tweetID;					// the GUID of the update
	IBOutlet NSInteger position;					// position 'x' of 'y' usages
	IBOutlet NSInteger usages;					// 'y' usages of this word
	IBOutlet NSURL *userAvatarURL;				// URL for the users's avatar
	IBOutlet NSDate *timestamp;					// timestamp of posting
	IBOutlet NSInteger inReplyToTweetID;			// GUID of post which this is a reply to
	
}

@property (nonatomic, retain) IBOutlet NSString *text;						// The update text itself
@property (nonatomic, retain) IBOutlet NSString *user;						// who posted the update
@property IBOutlet NSInteger tweetID;					// the GUID of the update
@property IBOutlet NSInteger position;					// position 'x' of 'y' usages
@property IBOutlet NSInteger usages;					// 'y' usages of this word
@property (nonatomic, retain) IBOutlet NSURL *userAvatarURL;				// URL for the users's avatar
@property (nonatomic, retain) IBOutlet NSDate *timestamp;					// timestamp of posting
@property IBOutlet NSInteger inReplyToTweetID;			// GUID of post which this is a reply to


@end
