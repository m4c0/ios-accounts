//
//  SACStore.h
//  
//
//  Created by Eduardo Costa on 06/05/14.
//
//

#import <Foundation/Foundation.h>

@import Accounts;

/** Facade for ACAccountStore */
@interface SACStore : NSObject

+ (instancetype)sharedInstance;

- (void)requestAccessToAccountsWithType:(NSString *)accountType
                                options:(NSDictionary *)options
                             completion:(ACAccountStoreRequestAccessCompletionHandler)completion;

@end
