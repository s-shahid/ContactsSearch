//
//  CSContactsManager.m
//  ContactsSearch
//
//  Created by Mohammed Shahid on 16/10/13.
//  Copyright (c) 2013 Mohammed Shahid. All rights reserved.
//

#import "CSContactsManager.h"

@implementation CSContactsManager

+ (id)sharedInstance
{
    static CSContactsManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CSContactsManager alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - Fetching Contacts

- (void) populateContactsFromAddressBook:(ABAddressBookRef) addressBook
                            alertHandler:(BlockHandler)blockHandler
{
    NSMutableArray *contactArray = [NSMutableArray array];
        
    CFArrayRef peopleArrayRef = ABAddressBookCopyArrayOfAllPeople(addressBook);
    
    NSArray *peopleArray = (__bridge NSArray*)peopleArrayRef;
    
    for(id person in peopleArray)
    {
        ABRecordRef recordRef = (__bridge ABRecordRef)person;
        CSContactsModel *contactsModel = [[CSContactsModel alloc]init];
        
        
        CFTypeRef firstNameRef =  ABRecordCopyValue(recordRef, kABPersonFirstNameProperty);
        contactsModel.firstName = (__bridge NSString *) firstNameRef;
        if (firstNameRef != nil)
            CFRelease(firstNameRef);
        
        
        CFTypeRef lastNameRef = ABRecordCopyValue(recordRef, kABPersonLastNameProperty);
        contactsModel.lastName = (__bridge NSString *) lastNameRef;
        if (lastNameRef != nil)
            CFRelease(lastNameRef);
        
        if(!contactsModel.lastName)
            contactsModel.lastName=@"";
        
        [contactArray addObject:contactsModel];
    }
    
    if (blockHandler) {
        blockHandler(contactArray);
    }
}

- (void) fetchContactsFromAddressBook:(BlockHandler) blockHandler
{
    __weak typeof(self) weakSelf = self;
    
    CFErrorRef errorRef = nil;
    
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &errorRef);
    if (!errorRef)
    {
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            if (granted && !error)
            {
                [weakSelf populateContactsFromAddressBook:addressBook alertHandler:blockHandler];
            }
        });
    }
    else
    {
        if (addressBook != nil)
            CFRelease(addressBook);
    }
}

@end
