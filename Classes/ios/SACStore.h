//
//  SACStore.h
//  
//
//  Created by Eduardo Costa on 06/05/14.
//
//

#import <Foundation/Foundation.h>

@class ACAccount;

/** Facade for ACAccountStore */
@interface SACStore : NSObject

+ (instancetype)sharedInstance;

- (void)requestAccessToAccountsWithType:(NSString *)accountType
                                options:(NSDictionary *)options
                                success:(void(^)(ACAccount *))success
                                failure:(void(^)(NSError *))failure;

@end
