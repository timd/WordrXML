//
//  RetrieveXMLController.m
//  WordrXML
//
//  Created by Tim Duckett on 02/02/2010.
//  Copyright 2010 Charismatic Megafauna Ltd. All rights reserved.
//

#import "RetrieveXMLController.h"


@implementation RetrieveXMLController

@synthesize urlString;
@synthesize tweetArray;

@synthesize parser;
@synthesize currentAttribute;
@synthesize xmlElementObjects;
@synthesize tempElement;


-(NSMutableArray *)retrieveTweetsFromURL:(NSString *)urlString {
	// Method to retrieve the tweets from a supplied URL
	// then return an array of tweets in the tweetArray NSMutableArray
	
	// Create a mutable array for the xmlElementObjects
	xmlElementObjects = [[NSMutableArray alloc] init];

	// Convert the supplied string into a useable URL
	NSURL *urlToRetrieve = [NSURL URLWithString:urlString] ;
	
	// Create new parser instance and load URL
	parser = [[NSXMLParser alloc] initWithContentsOfURL:urlToRetrieve];
	
	// Declare this controller as the delegate for the parser
	[parser setDelegate:self];
	
	// Run the paser itself
	if ([parser parse])
	{
		NSLog(@"Parsed OK");
		
	} else {
		NSLog(@"There's been a problem :-(");
	}

	
	// Return the array of Tweet objects
	return xmlElementObjects;
		
}


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


#pragma mark -
#pragma mark Parser Delegate Methods

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	// Parser delegate method that fires when an element STARTS

	// If it's a <status>
	if (![elementName compare:@"status"]) 
	{
		// It's a top-level section, therefore a new empty object will be required
		// alloc and init a new instance of a Tweet
		tempElement = [[Tweet alloc] init];
		
		// Now let's grab the contents of the 'created_at' and 'id' attributes
		NSString *created_at = [attributeDict valueForKey:@"created_at"];
		NSString *tweet_id = [attributeDict valueForKey:@"id"];
				
		NSLog(@"Created_at = %@ | id = %i", created_at, tweet_id);

		[tempElement setTimestamp:created_at];
		[tempElement setTweetID:tweet_id];
		
	}
	
	else if (![elementName compare:@"word"])
	{
		// It's the start of an <word> element
		NSLog(@"It's the start of a <word> element");
				
		// Grab the usages data
		NSString *usages = [attributeDict valueForKey:@"usages"];
		NSString *position = [attributeDict valueForKey:@"position"];
		NSLog(@"Usages = %@ | Position = %@", usages, position);
		
	} 
	
	
	else if (![elementName compare:@"text"])
	{
		// It's an <imageURL> starting, so clear out the currentAttribute string
		currentAttribute = [NSMutableString string];
	}
	
	else if (![elementName compare:@"user"]) 
	{
		// It's an <user> starting, so clear out the currentAttribute string
		currentAttribute = [NSMutableString string];
	}
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	//	Parser delegate method that fires when an element ENDS
	
	if (![elementName compare:@"status"]) 
	{
		// It's the end of a whole <status> element, therefore need to 
		// stuff the current object onto the end of the xmlElementObjects mutable array
		[xmlElementObjects addObject:tempElement];
		[tempElement release];
		
	}
	
	else if (![elementName compare:@"word"])
	{
		// It's the end of an <word> element
		NSLog(@"It's the end of a <word> element");
		
	} 
	
	else if (![elementName compare:@"user"]) 
	{
		// It's the end of an <user> element
		NSString *tweet_user = currentAttribute;
		NSLog(@"The user is %@", tweet_user);
		
		// Set the updateUser of tempElement to the current
		// attribute (using a synthesized method)
		[tempElement setUser:tweet_user];
		
		currentAttribute = [NSMutableString string];

		
	}
	
	else if (![elementName compare:@"text"])
	{
		// It's the end of an <text> element
		NSLog(@"The text is %@", currentAttribute);
		
		// Set the updateText of tempElement to the current
		// attribute (using a synthesized method)
		[tempElement setText:currentAttribute];
		
		currentAttribute = [NSMutableString string];

	} 
	
	else if (![elementName compare:@"statuses"]) 
	{
		// It's the end of the <statuses> section, 
		// Control will get passed back from whence it came...
		
	}
		
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	//	Parser delegate method that fires when characters are found

	if (self.currentAttribute) {
		// if the currentAttribute property exists, then add the characters
		// onto the end of itself
		[self.currentAttribute appendString:string];
		
	}
}
	
	
- (void)dealloc {
    [super dealloc];
}

@end
