//
//  SACAccountRequest.h
//  Pods
//
//  Created by Eduardo Costa on 06/05/14.
//
//

#import <Foundation/Foundation.h>

@interface SACAccountRequest : NSObject
- (void)requestAccessWithSuccess:(void(^)())success failure:(void(^)(NSError * error))failure;
@end


@interface SACAccountRequest (Protected)
- (NSString *)accountType;
- (NSDictionary *)options;
@end