//
//  CSViewController.h
//  ContactsSearch
//
//  Created by Mohammed Shahid on 16/10/13.
//  Copyright (c) 2013 Mohammed Shahid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSContactsModel.h"

@interface CSViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *contactsArray;

@property (nonatomic, strong) NSMutableArray *selectedContactsArray;

@property (weak, nonatomic) IBOutlet UITableView *contactsTableView;

@end
