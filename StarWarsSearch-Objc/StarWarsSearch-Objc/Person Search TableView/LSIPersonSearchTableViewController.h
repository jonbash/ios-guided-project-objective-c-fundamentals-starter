//
//  LSIPersonSearchTableViewController.h
//  Star Wars Search ObjC
//
//  Created by Spencer Curtis on 10/1/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBPersonController.h"

// forward class declaration - saying "I have a class named JBPersonController, don't worry!"
@class JBPersonController;

@interface LSIPersonSearchTableViewController : UITableViewController <UISearchBarDelegate>

@property NSArray *people;
@property JBPersonController *personController;

@end
