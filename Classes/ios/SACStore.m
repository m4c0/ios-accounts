//
//  SACStore.m
//  
//
//  Created by Eduardo Costa on 06/05/14.
//
//

#import "SACStore.h"

@import Accounts;
@import Social;

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

- (void)requestAccessToAccountsWithType:(NSString *)accountType options:(NSDictionary *)options success:(void (^)(ACAccount *))success failure:(void (^)(NSError *))failure {
    void (^completion)(BOOL, NSError *) = ^(BOOL granted, NSError * error){
        if (granted) {
            return success(accountStore.accounts[0]);
        }
        
        if ([self treatIfCommonError:error]) {
            return failure(nil);
        }
        if (failure) {
            failure(error);
        }
    };
    
    ACAccountType * type = [accountStore accountTypeWithAccountTypeIdentifier:accountType];
    [accountStore requestAccessToAccountsWithType:type options:options completion:completion];
}
- (BOOL)treatIfCommonError:(NSError *)error {
    if (error.domain != ACErrorDomain) {
        return NO;
    }
    
    switch (error.code) {
        case ACErrorAccountNotFound: {
            // Holy workaround, Batman! This is the only "native" way to have an working "Settings" button!
            [CATransaction begin];
            SLComposeViewController * vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            UIViewController * root = [UIApplication sharedApplication].keyWindow.rootViewController;
            [root presentViewController:vc animated:NO completion:^{
                [vc dismissViewControllerAnimated:YES completion:nil];
            }];
            [CATransaction commit];
            
            return YES;
        }
    }
    
    return NO;
}

@end
