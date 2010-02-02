//
//  WordrXMLTableAppDelegate.h
//  WordrXMLTable
//
//  Created by Tim Duckett on 02/02/2010.
//  Copyright Charismatic Megafauna Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordrXMLTableAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

