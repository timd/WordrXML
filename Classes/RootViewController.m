//
//  RootViewController.m
//  WordrXMLTable
//
//  Created by Tim Duckett on 02/02/2010.
//  Copyright Charismatic Megafauna Ltd 2010. All rights reserved.
//

#import "RootViewController.h"
#import "RetrieveXMLController.h"
#import "Tweet.h"


@implementation RootViewController

@synthesize grabbedData;
@synthesize nibLoadedCell;


- (void)viewDidLoad {

	NSLog(@"About to run the ViewDidLoad superclass method...");
    [super viewDidLoad];

	self.editButtonItem.possibleTitles = [NSSet setWithObjects:@"Add/Edit", @"Done", nil];
	
	self.editButtonItem.title = @"Update";
	
	self.navigationItem.rightBarButtonItem = self.editButtonItem;

	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	// Fire off the retrieve tweets method
	// First create an NSMutableArray to dump the grabbed data into
	
	grabbedData = [[NSMutableArray alloc] init];
	
	// Then create an instance of RetrieveXMLController
	RetrieveXMLController *xmlController;
	xmlController = [[RetrieveXMLController alloc] init];
	
	// Now go and grab the data from the url...	
	grabbedData = [xmlController retrieveTweetsFromURL:@"http://gollum.local/everyone2.xml"];
	
	// As a final check, spit out some diagnostics...
	NSLog(@"\n\nThere are %d objects in the array...", [grabbedData count]);
	
	
}

- (void) setEditing:(BOOL) editing animated:(BOOL) animated {
	[super setEditing:editing animated:animated];
	
	if (!editing)
		self.editButtonItem.title = @"Update";
}



/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
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
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
	NSLog(@"There are %d rows in the section", [grabbedData count]);
	return [grabbedData count];
	
	//return 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		
		// Code to use bespoke nib-based cell design from wordrTableCell.xib
		[[NSBundle mainBundle] loadNibNamed:@"wordrTableCell" owner:self options:NULL];
		cell = nibLoadedCell;
		
		// Original cell style code
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	Tweet *tweet = [grabbedData objectAtIndex:indexPath.row];
	
	// Using tag-based properties as set in IB
	UILabel *wordLabel = (UILabel *)[cell viewWithTag:1];
	wordLabel.text = tweet.text;
	
	UILabel	*userLabel = (UILabel *)[cell viewWithTag:2];
	userLabel.text = tweet.user;

	// TODO - add code to display custom images
	cell.imageView.image = [UIImage imageNamed:@"wordr.png"];
	
	// deprecated code to set cell labels when not using custom XIB
	//cell.textLabel.text = tweet.text;
	//cell.detailTextLabel.text = tweet.user;
	
	NSLog(@"user = %@", tweet.user);
	
    return cell;
}



/*
// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // Navigation logic may go here -- for example, create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController animated:YES];
	// [anotherViewController release];
}
*/


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
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
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

