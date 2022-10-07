//
//  AppDelegate.m
//  PocketGuthubC
//
//  Created by Timofey on 9/8/22.
//

#import "AppDelegate.h"

@interface AppDelegate ()
  
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  if (@available(iOS 13.0, *)) {
    
  } else {
    UIViewController *controller = [[UIViewController alloc] init];
    self.window = UIWindow.new;
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
  }
  
  
  return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
  
  
  return TRUE;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
  return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
  
}


@end
