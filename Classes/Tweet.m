//
//  Tweet.m
//  WordrXML
//
//  Created by Tim Duckett on 02/02/2010.
//  Copyright 2010 Charismatic Megafauna Ltd. All rights reserved.
//

#import "Tweet.h"


@implementation Tweet

@synthesize text;
@synthesize user;
@synthesize tweetID;
@synthesize position;
@synthesize usages;
@synthesize userAvatarURL;
@synthesize timestamp;
@synthesize inReplyToTweetID;


- init {
	// The simplest possible init method!
	return self;
}

-(id)initWithText:(NSString *)tweetText AndUser:(NSString *)tweetUser {
	self.text = tweetText;
	self.user = tweetUser;
	return self;
}
@end
