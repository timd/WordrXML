//
//  RootViewController.h
//  WordrXMLTable
//
//  Created by Tim Duckett on 02/02/2010.
//  Copyright Charismatic Megafauna Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullToRefreshTableViewController.h"

@class SecondLevelController;

@interface RootViewController : PullToRefreshTableViewController {
	
	NSMutableArray *grabbedData;
	UITableViewCell *nibLoadedCell;
	
	SecondLevelController *secondLevelController;
}

@property (nonatomic, retain) NSMutableArray *grabbedData;
@property (nonatomic, retain) IBOutlet UITableViewCell *nibLoadedCell;
@property (nonatomic, retain) IBOutlet SecondLevelController *secondLevelController;

-(void)reloadDataFromWordr;

@end
