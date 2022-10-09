//
//  MainCoordinator.m
//  PocketGuthubC
//
//  Created by Timofey on 9/10/2022.
//

#import <Foundation/Foundation.h>
#import "MainCoordinator.h"
#import "AuthService.h"
#import "StorageService.h"
#import "../Library/UIKit/UINavigationController/UINavigationController + Transparent.h"
#import "LoginViewController.h"
#import "RepoListViewController.h"


@interface MainCoordinator ()
@property (strong, nonatomic) AuthService *auth;
@property (strong, nonatomic) StorageService *storage;
@end

@implementation MainCoordinator

+ (instancetype)shared
{
  static MainCoordinator *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[MainCoordinator alloc] init];
  });
  return sharedInstance;
}

- (id)init {
  if (self = [super init]) {
    _auth = AuthService.shared;
    _storage = StorageService.shared;
  }
  return self;
}

- (void)start {
  NSString *key = [_storage getToken];
  UINavigationController *newNav;
  if (key != nil) {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout alloc];
    RepoListViewController *repoList = [[RepoListViewController alloc] initWithLayout:layout];
    newNav = [[UINavigationController alloc] initWithRootViewController: repoList];
  } else {
    LoginViewController *loginView = [[LoginViewController alloc] initWithCoordinator:self];
    newNav = [[UINavigationController alloc] initWithRootViewController: loginView];
  }
  [newNav makeTransparentNavBar];
  newNav.navigationBar.tintColor = [UIColor whiteColor];
  _nav = newNav;
  UIApplication.sharedApplication.windows[0].rootViewController = _nav;
}

- (void)toRepoList {
  UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout alloc];
  RepoListViewController *repoList = [[RepoListViewController alloc] initWithLayout:layout];
  [_nav setViewControllers:@[repoList] animated:true];
}

@end
