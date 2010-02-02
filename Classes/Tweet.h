//
//  Tweet.h
//  WordrXML
//
//  Created by Tim Duckett on 02/02/2010.
//  Copyright 2010 Charismatic Megafauna Ltd. All rights reserved.
//

//	This is the core Tweet object which holds details of an individual posting

#import <Foundation/Foundation.h>


@interface Tweet : NSObject {
	
	NSString *text;						// The update text itself
	NSString *user;						// who posted the update
	NSInteger tweetID;					// the GUID of the update
	NSInteger position;					// position 'x' of 'y' usages
	NSInteger usages;					// 'y' usages of this word
	NSURL *userAvatarURL;				// URL for the users's avatar
	NSDate *timestamp;					// timestamp of posting
	NSInteger inReplyToTweetID;			// GUID of post which this is a reply to
	
}

@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *user;
@property NSInteger tweetID;
@property NSInteger position;
@property NSInteger usages;
@property (nonatomic, retain) NSURL *userAvatarURL;
@property (nonatomic, retain) NSDate *timestamp;
@property NSInteger inReplyToTweetID;

-init;

-(id)initWithText:(NSString *)tweetText AndUser:(NSString *)tweetUser;

@end
