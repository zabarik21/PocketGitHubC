//
//  AuthConstants.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "AuthConstants.h"

@implementation AuthConstants
NSString *const loginObserverKey = @"loginObserver";
NSString *const clientIdKey = @"client_id";
NSString *const clientId = @"1a9af791d200ed9ae525";
NSString *const cliendSecretKey = @"client_secret";
NSString *const cliendSecret = @"fb66ec5f993635aa301146e21efb129da8e432f7";
NSString *const codeKey = @"code";
NSString *const redirectURIKey = @"redirect_uri";
NSString *const redirectURI = @"pocket-github://oauth-callback";
NSString *const authorizeURL = @"https://github.com/login/oauth/authorize";
NSString *const accessTokenURL = @"https://github.com/login/oauth/access_token";
NSString *const accessTokenKey = @"access_token";
@end
