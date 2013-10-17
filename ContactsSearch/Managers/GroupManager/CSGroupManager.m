//
//  CSGroupManager.m
//  ContactsSearch
//
//  Created by Mohammed Shahid on 16/10/13.
//  Copyright (c) 2013 Mohammed Shahid. All rights reserved.
//

#import "CSGroupManager.h"

@implementation CSGroupManager

+ (CSGroupManager *)sharedInstance
{
    static CSGroupManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CSGroupManager alloc] init];
    });
    
    return sharedInstance;
}

@end
