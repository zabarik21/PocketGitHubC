//
//  LoginViewRouter.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "Interfaces/LoginViewRouterProtocol.h"
#import "../RepoListModule/RepoListViewController.h"

@implementation LoginViewRouter

- (void)toRepoList {
//  dispatch_async(dispatch_get_main_queue(), ^{
//    RepoListViewController *repoList = [[RepoListViewController alloc] init];
//    UIApplication.sharedApplication.windows[0].rootViewController = repoList;
//    [UIApplication.sharedApplication.windows[0] makeKeyAndVisible];
//  });
  dispatch_async(dispatch_get_main_queue(), ^{
    [self->_coordinator toRepoList];
  });
}

@end
