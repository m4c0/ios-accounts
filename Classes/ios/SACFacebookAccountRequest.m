//
//  SACFacebookAccountRequest.m
//  Pods
//
//  Created by Eduardo Costa on 06/05/14.
//
//

#import "SACFacebookAccountRequest.h"

@import Accounts;

@implementation SACFacebookAccountRequest

- (NSString *)accountType {
    return ACAccountTypeIdentifierFacebook;
}
- (NSDictionary *)options {
    return @{ ACFacebookAppIdKey       : self.facebookAppId,
              ACFacebookPermissionsKey : self.facebookPermissions };
}

@end
