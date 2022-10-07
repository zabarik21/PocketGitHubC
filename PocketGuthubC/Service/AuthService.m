//
//  AuthService.m
//  PocketGuthubC
//
//  Created by Timofey on 10/8/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "AuthService.h"

@interface AuthService()

@property (nonatomic, strong) NSNotificationCenter* notification;
-(void)pushNotification;
-(void)handleCodeResponce:(id  _Nullable)responce;
-(NSString *)getCodeFrom:(NSURL*)url;
@end


@implementation AuthService

static NSString *const loginObserverKey = @"loginObserver";
static NSString *const clientIdKey = @"client_id";
static NSString *const clientId = @"1a9af791d200ed9ae525";
static NSString *const cliendSecretKey = @"client_secret";
static NSString *const cliendSecret = @"fb66ec5f993635aa301146e21efb129da8e432f7";
static NSString *const codeKey = @"code";
static NSString *const redirectURIKey = @"redirect_uri";
static NSString *const redirectURI = @"pocket-github://oauth-callback";
static NSString *const authorizeURL = @"https://github.com/login/oauth/authorize";
static NSString *const accessTokenURL = @"https://github.com/login/oauth/access_token";


+ (instancetype)shared
{
    static AuthService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AuthService alloc] init];
    });
    return sharedInstance;
}

-(id)init {
  if (self = [super init]) {
    _notification = NSNotificationCenter.defaultCenter;
  }
  return self;
}

-(void) tryOauth {
  NSURLComponents *comps = [NSURLComponents componentsWithString:authorizeURL];
  
  NSArray<NSURLQueryItem *> * items = @[
    [NSURLQueryItem queryItemWithName:clientIdKey value:clientId],
    [NSURLQueryItem queryItemWithName:cliendSecretKey value:cliendSecret],
    [NSURLQueryItem queryItemWithName:redirectURIKey value:redirectURI]
  ];
  
  comps.queryItems = items;
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [UIApplication.sharedApplication openURL:comps.URL];
  });
}

-(void) handleUrl:(NSURL*)url {
  NSString *code = [self getCodeFrom:url];
  if (code == nil) { return; }
  
  NSDictionary<NSString*, NSString*> *items = [NSDictionary new];
  
  [items setValue:clientId forKey:clientIdKey];
  [items setValue:cliendSecret forKey:cliendSecretKey];
  [items setValue:redirectURI forKey:redirectURIKey];
  [items setValue:code forKey:codeKey];
  
  NSDictionary<NSString*, NSString*> *params = [NSDictionary new];
  [params setValue:@"application/json" forKey:@"Accept"];
  
  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  
  [manager
   POST:accessTokenURL
   parameters:items
   headers: params
   progress:^(NSProgress * _Nonnull uploadProgress) {
    NSLog(@"%@", uploadProgress);
  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    [self handleCodeResponce:responseObject];
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    NSLog(@"Error %@", error);
  }];
}
    
-(void)handleCodeResponce:(id  _Nullable)responseObject {
  if ([responseObject isKindOfClass:[NSArray class]]) {
      NSArray *responseArray = responseObject;
      NSLog(@"Array: %@", responseArray);
  } else if ([responseObject isKindOfClass:[NSDictionary class]]) {
      NSDictionary *responseDict = responseObject;
      NSLog(@"Dict: %@", responseDict);
  }
}

-(void)pushNotification {
  [_notification
     postNotificationName:loginObserverKey
     object:nil
  ];
}

-(NSString *_Nullable)getCodeFrom:(NSURL*)url {
  NSArray<NSURLQueryItem *> *_Nullable items = [[NSURLComponents
                           componentsWithURL:url
                           resolvingAgainstBaseURL:true] queryItems];
  if (items == nil) { return nil; }
  
  NSUInteger count = [items count];
  for (int i = 0; i < count; i++) {
    NSURLQueryItem *item = [items objectAtIndex:i];
    if ([item.name  isEqual: @"code"]) {
      return item.value;
    }
  }
  return nil;
}

@end
