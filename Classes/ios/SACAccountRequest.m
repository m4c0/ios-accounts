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

- (void)requestAccessWithSuccess:(void (^)())success failure:(void (^)(NSError *))failure {
    void (^completion)(BOOL, NSError *) = ^(BOOL granted, NSError * error){
        if (granted) {
            success();
        } else {
            failure(error);
        }
    };
    
    [[SACStore sharedInstance] requestAccessToAccountsWithType:[self accountType]
                                                       options:[self options]
                                                    completion:completion];
}

@end
