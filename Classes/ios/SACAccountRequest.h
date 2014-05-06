//
//  SACAccountRequest.h
//  Pods
//
//  Created by Eduardo Costa on 06/05/14.
//
//

#import <Foundation/Foundation.h>

@class ACAccount;

@interface SACAccountRequest : NSObject
- (void)requestAccessWithSuccess:(void(^)(ACAccount *))success failure:(void(^)(NSError *))failure;
@end


@interface SACAccountRequest (Protected)
- (NSString *)accountType;
- (NSDictionary *)options;
@end