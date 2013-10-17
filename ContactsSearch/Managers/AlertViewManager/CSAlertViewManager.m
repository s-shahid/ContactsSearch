//
//  CSAlertViewManager.m
//  ContactsSearch
//
//  Created by Mohammed Shahid on 16/10/13.
//  Copyright (c) 2013 Mohammed Shahid. All rights reserved.
//

#import "CSAlertViewManager.h"

@implementation CSAlertViewManager

+ (id)sharedInstance
{
    static CSAlertViewManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CSAlertViewManager alloc] init];
    });
    
    return sharedInstance;
}

- (void) showAlertViewWithTitle:(NSString *)title
                        message:(NSString *)message
              cancelButtonTitle:(NSString *)cancelButtonTitle
              otherButtonTitles:(NSArray *)otherButtonTitles
                   alertHandler:(AlertHandler)alertHandlerBlock
{
    CSAlertView *alertView = [[CSAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:cancelButtonTitle
                                              otherButtonTitles:nil];
    
    for (NSString *title in otherButtonTitles) {
        [alertView addButtonWithTitle:title];
    }
    
    alertView.alertHandler = alertHandlerBlock;
    
    [alertView show];
}

#pragma mark - AlertView Delegate Method

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (((CSAlertView *)alertView).alertHandler) {
        ((CSAlertView *)alertView).alertHandler(buttonIndex);
    }
}

@end
