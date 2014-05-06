//
//  SACStore.m
//  
//
//  Created by Eduardo Costa on 06/05/14.
//
//

#import "SACStore.h"

@implementation SACStore {
    ACAccountStore * accountStore;
}

+ (instancetype)sharedInstance {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:nil] init];
    });
    return instance;
}
+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedInstance];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        accountStore = [ACAccountStore new];
    }
    return self;
}

- (void)requestAccessToAccountsWithType:(NSString *)accountType options:(NSDictionary *)options completion:(ACAccountStoreRequestAccessCompletionHandler)completion {
    ACAccountType * type = [accountStore accountTypeWithAccountTypeIdentifier:accountType];
    [accountStore requestAccessToAccountsWithType:type options:options completion:completion];
}

@end
