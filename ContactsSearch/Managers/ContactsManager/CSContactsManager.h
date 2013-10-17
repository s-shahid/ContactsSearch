//
//  CSContactsManager.h
//  ContactsSearch
//
//  Created by Mohammed Shahid on 16/10/13.
//  Copyright (c) 2013 Mohammed Shahid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#import "CSContactsModel.h"

typedef void (^BlockHandler)(NSMutableArray *contactsArray);

@interface CSContactsManager : NSObject

@property (nonatomic, copy) BlockHandler blockHandler;


+ (id)sharedInstance;

- (void) fetchContactsFromAddressBook:(BlockHandler) alertHandler;

@end
