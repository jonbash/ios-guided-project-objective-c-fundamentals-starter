//
//  LSIPersonTableViewCell.h
//  Star Wars Search ObjC
//
//  Created by Spencer Curtis on 10/1/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSIPersonTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *eyeColorLabel;

// TODO: Create a person property and updateViews method

@end
