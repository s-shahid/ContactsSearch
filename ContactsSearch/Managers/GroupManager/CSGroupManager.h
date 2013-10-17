//
//  CSGroupManager.h
//  ContactsSearch
//
//  Created by Mohammed Shahid on 16/10/13.
//  Copyright (c) 2013 Mohammed Shahid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSGroupManager : NSObject

@property(nonatomic, strong) NSMutableArray *selectedContactsArray;


+ (CSGroupManager *)sharedInstance;

@end
