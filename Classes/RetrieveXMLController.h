//
//  RetrieveXMLController.h
//  WordrXML
//
//  Created by Tim Duckett on 02/02/2010.
//  Copyright 2010 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

//	This controller retrieves the XML from the supplied URL,
//	and returns an NSArray of Tweet objects through the magic of 
//	retrieveTweetsFromURL
//
//	It uses the NSXMLParser library to handle the XML feed from the Wordr site.


@interface RetrieveXMLController : UIView {
	
	NSString *urlString;
	NSMutableArray *tweetArray;
	
	NSXMLParser *parser;
	NSMutableString *currentAttribute;
	NSMutableArray *xmlElementObjects;
	
	Tweet *tempElement;

}

@property (nonatomic, retain) NSString *urlString;
@property (nonatomic, retain) NSMutableArray *tweetArray;

@property (nonatomic, retain) NSXMLParser *parser;
@property (nonatomic, retain) NSMutableString *currentAttribute;
@property (nonatomic, retain) NSMutableArray *xmlElementObjects;

@property (nonatomic, retain) Tweet *tempElement;

-(NSMutableArray *)retrieveTweetsFromURL:(NSString *)urlString;

@end
