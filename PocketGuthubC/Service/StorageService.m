//
//  StorageService.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "StorageService.h"
#import "AuthConstants.h"

@interface StorageService()
@property NSUserDefaults *storage;
extern NSString *tokenKey;
@end

@implementation StorageService

NSString *tokenKey = @"token";

+ (instancetype)shared
{
  static StorageService *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[StorageService alloc] init];
  });
  return sharedInstance;
}

-(id)init {
  if (self = [super init]) {
    _storage = NSUserDefaults.standardUserDefaults;
  
  }
  return self;
}


- (void)saveToken:(NSString *)token {
  [_storage setValue:token forKey:tokenKey];
}

- (NSString *)getToken {
  return [_storage valueForKey:tokenKey];
}

@end
