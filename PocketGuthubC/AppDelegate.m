//
//  AppDelegate.m
//  PocketGuthubC
//
//  Created by Timofey on 9/8/22.
//

#import "AppDelegate.h"
#import "Service/AuthService.h"
#import "Service/GithubService.h"
#import "MainCoordinator.h"
@interface AppDelegate ()
@property MainCoordinator *mainCoordinator;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  if (@available(iOS 13.0, *)) {
    
  } else {
    _mainCoordinator = MainCoordinator.shared;
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [self.window makeKeyAndVisible];
    [_mainCoordinator start];
  }
  return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
  NSString *sourceApp = [options valueForKey: UIApplicationOpenURLOptionsSourceApplicationKey];
  NSLog(@"%@", sourceApp);
  if ([sourceApp  isEqual: @"com.apple.SafariViewService"] || [sourceApp  isEqual: @"com.apple.mobilesafari"]) {
    if ([url.host  isEqual: @"oauth-callback"]) {
      [AuthService.shared handleUrl:url];
      return true;
    }
  }
  return false;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
  return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


@end
