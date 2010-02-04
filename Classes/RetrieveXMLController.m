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

	// If it's a <PictureInfo>
	if (![elementName compare:@"status"]) 
	{
		// It's a top-level section, therefore a new empty object will be required
		// alloc and init a new instance of a Tweet
		tempElement = [[Tweet alloc] init];
	}
	
	else if (![elementName compare:@"word"])
	{
		// It's the start of an <word> element
		NSLog(@"It's the start of a <word> element");
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
		
	}
	
	else if (![elementName compare:@"word"])
	{
		// It's the end of an <word> element
		NSLog(@"It's the end of a <word> element");
	} 
	
	else if (![elementName compare:@"text"])
	{
		// It's the end of an <text> element
		NSLog(@"The text is %@", currentAttribute);
		
		// Set the updateText of tempElement to the current
		// attribute (using a synthesized method)
		[tempElement setText:currentAttribute];
	} 
	
	else if (![elementName compare:@"user"]) 
	{
		// It's the end of an <user> element
		NSLog(@"The user is %@", currentAttribute);
		
		// Set the updateUser of tempElement to the current
		// attribute (using a synthesized method)
		[tempElement setUser:currentAttribute];
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
