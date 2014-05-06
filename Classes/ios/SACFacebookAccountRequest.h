//
//  SACFacebookAccountRequest.h
//  Pods
//
//  Created by Eduardo Costa on 06/05/14.
//
//

#import "SACAccountRequest.h"

@interface SACFacebookAccountRequest : SACAccountRequest
@property (nonatomic, strong) NSString * facebookAppId;
@property (nonatomic, strong) NSArray * facebookPermissions;
@end
