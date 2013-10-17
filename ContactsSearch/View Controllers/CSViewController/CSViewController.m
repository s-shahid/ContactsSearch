//
//  CSViewController.m
//  ContactsSearch
//
//  Created by Mohammed Shahid on 16/10/13.
//  Copyright (c) 2013 Mohammed Shahid. All rights reserved.
//

#import "CSViewController.h"

@interface CSViewController ()

@end

@implementation CSViewController

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.contactsArray = [NSMutableArray array];
    self.selectedContactsArray = [NSMutableArray array];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [ContactsManager fetchContactsFromAddressBook:^(NSMutableArray *contactsArray) {
        
        self.contactsArray = contactsArray;
        
        [self.contactsTableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - TableView Delegate Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    CSContactsModel *contactsModel = [self.contactsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",contactsModel.firstName,contactsModel.lastName];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.selectedContactsArray removeObject:[self.contactsArray objectAtIndex:indexPath.row]];
        [GroupManager.selectedContactsArray removeObject:[self.contactsArray objectAtIndex:indexPath.row]];
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.selectedContactsArray addObject:[self.contactsArray objectAtIndex:indexPath.row]];
        
        if (!GroupManager.selectedContactsArray) {
            GroupManager.selectedContactsArray = [[NSMutableArray alloc]init];
        }
        
        [GroupManager.selectedContactsArray addObject:[self.contactsArray objectAtIndex:indexPath.row]];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contactsArray count];
}

@end
