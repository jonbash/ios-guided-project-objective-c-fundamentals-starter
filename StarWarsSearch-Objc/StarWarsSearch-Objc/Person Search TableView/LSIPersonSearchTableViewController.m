//
//  LSIPersonSearchTableViewController.m
//  Star Wars Search ObjC
//
//  Created by Spencer Curtis on 10/1/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSIPersonSearchTableViewController.h"
#import "LSIPersonTableViewCell.h"

@interface LSIPersonSearchTableViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation LSIPersonSearchTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _personController = [[JBPersonController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.personController searchForPeopleWithSearchTerm:searchBar.text completion:^(NSArray *people, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        NSLog(@"People: %@", people);
        self.people = people;

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSIPersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell" forIndexPath:indexPath];

    JBPerson *person = self.people[indexPath.row];

    cell.nameLabel.text = person.name;
    cell.birthYearLabel.text = person.birthYear;
    cell.eyeColorLabel.text = person.eyeColor;
    cell.heightLabel.text = person.height;

    return cell;
}

@end
