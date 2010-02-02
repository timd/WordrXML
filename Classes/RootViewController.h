//
//  RootViewController.h
//  WordrXMLTable
//
//  Created by Tim Duckett on 02/02/2010.
//  Copyright Charismatic Megafauna Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	
	NSMutableArray *grabbedData;
	UITableViewCell *nibLoadedCell;
}

@property (nonatomic, retain) NSMutableArray *grabbedData;
@property (nonatomic, retain) IBOutlet UITableViewCell *nibLoadedCell;

@end
