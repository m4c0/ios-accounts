//
//  SAEViewController.m
//  Example
//
//  Created by Eduardo Costa on 06/05/14.
//  Copyright (c) 2014 Eduardo Mauricio da Costa. All rights reserved.
//

#import "SAEViewController.h"

#import <SACFacebookAccountRequest.h>

@interface SAEViewController ()
@property (nonatomic, weak) IBOutlet UIButton * login;
@property (nonatomic, weak) IBOutlet UIButton * logout;
@property (nonatomic, weak) IBOutlet UILabel * label;
@end

@implementation SAEViewController

- (IBAction)login:(id)sender {
    self.login.hidden = YES;
    
    SACFacebookAccountRequest * request = [SACFacebookAccountRequest new];
    request.facebookAppId = @"477322999042033";
    request.facebookPermissions = @[ @"email" ];
    [request requestAccessWithCompletion:^(BOOL granted, NSError *error) {
        if (granted) {
            self.label.hidden = YES;
            self.login.hidden = YES;
            self.logout.hidden = NO;
        } else {
            self.label.text = [error description];
            self.label.hidden = NO;
            self.login.hidden = NO;
            self.logout.hidden = YES;
        }
    }];
}
- (IBAction)logout:(id)sender {
    self.login.hidden = NO;
    self.logout.hidden = YES;
}

@end
