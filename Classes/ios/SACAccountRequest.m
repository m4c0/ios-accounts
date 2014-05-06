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

- (void)requestAccessWithSuccess:(void (^)(ACAccount *))success failure:(void (^)(NSError *))failure {
    [[SACStore sharedInstance] requestAccessToAccountsWithType:[self accountType]
                                                       options:[self options]
                                                       success:success
                                                       failure:failure];
}

@end
