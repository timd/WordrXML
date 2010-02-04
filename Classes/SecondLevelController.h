//
//  SecondLevelController.h
//  WordrXMLTable
//
//  Created by Tim Duckett on 04/02/2010.
//  Copyright 2010 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface SecondLevelController : UIViewController {
		
	NSString *text;						// The update text itself
	NSString *user;						// who posted the update
	NSInteger tweetID;					// the GUID of the update
	NSInteger position;					// position 'x' of 'y' usages
	NSInteger usages;					// 'y' usages of this word
	NSURL *userAvatarURL;				// URL for the users's avatar
	NSDate *timestamp;					// timestamp of posting
	NSInteger inReplyToTweetID;			// GUID of post which this is a reply to
	
	UILabel *textLabel;
	UILabel *userLabel;
	UILabel *tweetIDLabel;
	UILabel *positionLabel;
	UILabel *usagesLabel;
	UILabel *userAvatarULLabel;
	UILabel *timestampLabel;
	UILabel *inReplyToTweetIDLabel;
	
}

@property (nonatomic, retain) NSString *text;						// The update text itself
@property (nonatomic, retain) NSString *user;						// who posted the update
@property NSInteger tweetID;					// the GUID of the update
@property NSInteger position;					// position 'x' of 'y' usages
@property NSInteger usages;					// 'y' usages of this word
@property (nonatomic, retain) NSURL *userAvatarURL;				// URL for the users's avatar
@property (nonatomic, retain) NSDate *timestamp;					// timestamp of posting
@property NSInteger inReplyToTweetID;			// GUID of post which this is a reply to

@property (nonatomic, retain) IBOutlet UILabel *textLabel;
@property (nonatomic, retain) IBOutlet UILabel *userLabel;
@property (nonatomic, retain) IBOutlet UILabel *tweetIDLabel;
@property (nonatomic, retain) IBOutlet UILabel *positionLabel;
@property (nonatomic, retain) IBOutlet UILabel *usagesLabel;
@property (nonatomic, retain) IBOutlet UILabel *userAvatarULLabel;
@property (nonatomic, retain) IBOutlet UILabel *timestampLabel;
@property (nonatomic, retain) IBOutlet UILabel *inReplyToTweetIDLabel;



@end
