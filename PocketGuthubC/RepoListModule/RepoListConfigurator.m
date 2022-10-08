//
//  RepoListConfigurator.m
//  PocketGuthubC
//
//  Created by Timofey on 8/10/2022.
//

#import <Foundation/Foundation.h>
#import "RepoListConfigurator.h"
#import "RepoListInteractor.h"
#import "RepoListPresenter.h"
#import "RepoListViewController.h"
#import "RepoListRouter.h"

@implementation RepoListConfigurator

- (void)configureWith:(RepoListViewController *)view {
  RepoListPresenter *presenter = [[RepoListPresenter new] initWithView:view];
  RepoListInteractor *interactor = [RepoListInteractor alloc];
  RepoListRouter *router = [RepoListRouter alloc];
  
  view.presenter = presenter;
  presenter.interactor = interactor;
  interactor.presenter = presenter;
}

@end
