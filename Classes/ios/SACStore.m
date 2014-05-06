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

NSString * const SACStoreErrorDomain = @"com.github.simplified-ac-accounts";

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
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                return success(accountStore.accounts[0]);
            }

            [self treatCommonErrorFrom:error fallback:failure];
        });
    };
    
    ACAccountType * type = [accountStore accountTypeWithAccountTypeIdentifier:accountType];
    [accountStore requestAccessToAccountsWithType:type options:options completion:completion];
}

- (void)treatCommonErrorFrom:(NSError *)error fallback:(void (^)(NSError *))failure {
    NSError * ourError = [NSError errorWithDomain:SACStoreErrorDomain code:0 userInfo:@{ NSUnderlyingErrorKey : error }];
    
    if (!error) {
        [[[UIAlertView alloc] initWithTitle:nil
                                    message:NSLocalizedString(@"Access to account was previously denied. You can change it at Settings.", @"Alert text to show when denied the access to the account")
                                   delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"OK", @"Button of the alert to show when denied the access to the account")
                          otherButtonTitles:nil] show];
        return failure(ourError);
    }
    
    if (![error.domain isEqualToString:ACErrorDomain]) {
        return failure(error);
    }
    
    switch (error.code) {
        case ACErrorAccountNotFound: {
            // Holy workaround, Batman! This is the only "native" way to have an working "Settings" button!
            [CATransaction begin];
            SLComposeViewController * vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            UIViewController * root = [UIApplication sharedApplication].keyWindow.rootViewController;
            [root presentViewController:vc animated:NO completion:^{
                [vc dismissViewControllerAnimated:NO completion:^{
                    return failure(ourError);
                }];
            }];
            [CATransaction commit];
            break;
        }
        default: {
            [[[UIAlertView alloc] initWithTitle:nil
                                        message:error.userInfo[NSLocalizedDescriptionKey] ?: NSLocalizedString(@"Could not access account. (Error %d)", @"Alert text to show when an unknown error happens while retrieving social account")
                                       delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK", @"Button from alert to show when an unknown error happens while retrieving social account")
                              otherButtonTitles:nil] show];
            return failure(ourError);
        }
    }
}

@end
