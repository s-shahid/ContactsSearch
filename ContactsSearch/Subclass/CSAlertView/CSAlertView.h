//
//  CSAlertView.h
//  ContactsSearch
//
//  Created by Mohammed Shahid on 16/10/13.
//  Copyright (c) 2013 Mohammed Shahid. All rights reserved.
//

#import <UIKit/UIKit.h> 

typedef void (^AlertHandler)(int buttonIndex);

@interface CSAlertView : UIAlertView

@property (nonatomic, copy) AlertHandler alertHandler;

@end
