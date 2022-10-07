//
//  SceneDelegate.m
//  PocketGuthubC
//
//  Created by Timofey on 9/8/22.
//

#import "SceneDelegate.h"
#import "LoginModule/LoginViewController.h"
#import "Service/AuthService.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions  API_AVAILABLE(ios(13.0)) {
 
  if ([scene isKindOfClass:[UIWindowScene class]])
  {
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    UIViewController *viewController = LoginViewController.new;
    UIWindow *window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window = window;
    window.rootViewController = viewController;
    [window makeKeyAndVisible];
  }

}


- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts API_AVAILABLE(ios(13.0)){
  NSURL *callBackUrl = [[URLContexts allObjects] firstObject].URL;

}

- (void)sceneDidDisconnect:(UIScene *)scene API_AVAILABLE(ios(13.0))  {
  // Called as the scene is being released by the system.
  // This occurs shortly after the scene enters the background, or when its session is discarded.
  // Release any resources associated with this scene that can be re-created the next time the scene connects.
  // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene API_AVAILABLE(ios(13.0)) {
  // Called when the scene has moved from an inactive state to an active state.
  // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene API_AVAILABLE(ios(13.0)) {
  // Called when the scene will move from an active state to an inactive state.
  // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene API_AVAILABLE(ios(13.0)) {
  // Called as the scene transitions from the background to the foreground.
  // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene API_AVAILABLE(ios(13.0)) {
  // Called as the scene transitions from the foreground to the background.
  // Use this method to save data, release shared resources, and store enough scene-specific state information
  // to restore the scene back to its current state.
}


@end
