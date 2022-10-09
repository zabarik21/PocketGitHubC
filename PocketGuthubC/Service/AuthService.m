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
#import "AuthConstants.h"
#import "StorageService.h"

@interface AuthService()

@property (nonatomic, strong) NSNotificationCenter* notification;
-(void)pushNotification;
-(void)handleCodeResponce:(id  _Nullable)responce;
-(NSString *)getCodeFrom:(NSURL*)url;
@end

@implementation AuthService

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
  
  NSMutableDictionary<NSString*, NSString*> *items = [NSMutableDictionary new];
  
  [items setValue:clientId forKey:clientIdKey];
  [items setValue:cliendSecret forKey:cliendSecretKey];
  [items setValue:redirectURI forKey:redirectURIKey];
  [items setValue:code forKey:codeKey];
  
  
  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  
  [manager
   POST:accessTokenURL
   parameters:items
   headers: @{
    @"Accept": @"application/json"
  }
   progress:^(NSProgress * _Nonnull uploadProgress) {
    
  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    [self handleCodeResponce:responseObject];
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    NSLog(@"Error %@", error);
  }];
}

-(void)handleCodeResponce:(id  _Nullable)responseObject {
  if ([responseObject isKindOfClass:[NSDictionary class]]) {
    NSDictionary *responseDict = responseObject;
    NSLog(@"Dict: %@", responseDict);
    NSString *key = responseDict[accessTokenKey];
    [StorageService.shared saveToken:key];
    [self pushNotification];
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
