//
//  SecondLevelController.m
//  WordrXMLTable
//
//  Created by Tim Duckett on 04/02/2010.
//  Copyright 2010 Charismatic Megafauna Ltd. All rights reserved.
//

#import "SecondLevelController.h"
#import "RootViewController.h"


@implementation SecondLevelController

@synthesize text;
@synthesize	user;
@synthesize	tweetID;					// the GUID of the update
@synthesize	position;					// position 'x' of 'y' usages
@synthesize	usages;						// 'y' usages of this word
@synthesize	userAvatarURL;				// URL for the users's avatar
@synthesize	timestamp;					// timestamp of posting
@synthesize	inReplyToTweetID;			// GUID of post which this is a reply to

@synthesize textLabel;
@synthesize userLabel;
@synthesize tweetIDLabel;
@synthesize positionLabel;
@synthesize usagesLabel;
@synthesize userAvatarULLabel;
@synthesize timestampLabel;
@synthesize inReplyToTweetIDLabel;


-(IBAction)touchToPopController {
	// Touch to pop controller
	[self.navigationController popViewControllerAnimated:YES];
	
}


/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/


- (void)viewDidLoad {
    [super viewDidLoad];

	NSLog(@"Firing the SecondLevelViewController viewDidLoad method");
	
	// let's see if we can access the data that got passed in...
	
	//NSInteger dataCount = [RootViewController.grabbedData count];
	
	
	
	
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	self.title = nil;
	
	self.title = @"";
	
	NSLog(@"Firing the SecondLevelViewController viewWillAppear method");
	
	NSLog(@"The user is %@ and the tweet is %@", self.user, self.text);
	
	textLabel.text = self.text;
	userLabel.text = self.user;
	//	UILabel *tweetIDLabel;
	//	UILabel *positionLabel;
	//	UILabel *usagesLabel;
	//	UILabel *userAvatarULLabel;
	//	UILabel *timestampLabel;
	//	UILabel *inReplyToTweetIDLabel;
	
	
	
	
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
	
	
}

/*

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// NSLog(@"Firing secondLevelCellController cellForRowAtIndexPath method");

    static NSString *CellIdentifier = @"SecondLevelControllerCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
    
	cell.textLabel.text = self.text;
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// NSLog(@"Firing the secondLevelController didSelectRowAtIndexPath method");
	[self.navigationController popViewControllerAnimated:YES];
	
    // Navigation logic may go here. Create and push another view controller.
    // AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
    // [self.navigationController pushViewController:anotherViewController];
    // [anotherViewController release];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
	
    [super dealloc];
}


@end

