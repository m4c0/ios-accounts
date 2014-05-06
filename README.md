# SimplifiedACAccounts

[![Version](http://cocoapod-badges.herokuapp.com/v/SimplifiedACAccounts/badge.png)](http://cocoadocs.org/docsets/SimplifiedACAccounts)
[![Platform](http://cocoapod-badges.herokuapp.com/p/SimplifiedACAccounts/badge.png)](http://cocoadocs.org/docsets/SimplifiedACAccounts)

## Usage

    #import <SACFacebookAccountRequest.h>

    ...
    
    SACFacebookAccountRequest * request = [SACFacebookAccountRequest new];
    request.facebookAppId = @"...";
    request.facebookPermissions = @[ @"email" ];
    [request requestAccessWithSuccess:^(ACAccount * acc) {
        // Whooray!
    } failure:^(NSError *error) {
        if (![error.domain isEqualToString:SACStoreErrorDomain]) {
            // Oh no! Unknown error!
        }
    }];

## Requirements

## Installation

SimplifiedACAccounts is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "SimplifiedACAccounts"

## Author

Eduardo Costa <sac@tpk.com.br>

## License

SimplifiedACAccounts is available under the LGPLv3 license. See the LICENSE file for more info.

