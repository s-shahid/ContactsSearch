//
//  CSAlertViewManager.h
//  ContactsSearch
//
//  Created by Mohammed Shahid on 16/10/13.
//  Copyright (c) 2013 Mohammed Shahid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSAlertView.h"

@interface CSAlertViewManager : NSObject

+ (id)sharedInstance;

- (void) showAlertViewWithTitle:(NSString *)title
                        message:(NSString *)message
              cancelButtonTitle:(NSString *)cancelButtonTitle
              otherButtonTitles:(NSArray *)otherButtonTitles
                   alertHandler:(AlertHandler)alertHandlerBlock;

@end
