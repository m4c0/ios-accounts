//
//  SACAccountRequest.m
//  Pods
//
//  Created by Eduardo Costa on 06/05/14.
//
//

#import "SACAccountRequest.h"

#import "SACStore.h"

@implementation SACAccountRequest

- (void)requestAccessWithCompletion:(void (^)(BOOL, NSError *))completion {
    [[SACStore sharedInstance] requestAccessToAccountsWithType:[self accountType]
                                                       options:[self options]
                                                    completion:completion];
}

@end
