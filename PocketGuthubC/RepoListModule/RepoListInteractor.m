//
//  RepoListInteractor.m
//  PocketGuthubC
//
//  Created by Timofey on 8/10/2022.
//

#import <Foundation/Foundation.h>
#import "RepoListInteractor.h"
#import "VIPER Protocols.h"
#import "../Service/GithubService.h"


@interface RepoListInteractor ()
@property (strong, nonatomic) GithubService *githubService;
@property (strong, nonatomic) NSMutableArray<Repo *> *repos;
@end

@implementation RepoListInteractor

-(id)init {
  if (self = [super init]) {
    _githubService = GithubService.shared;
    _repos = [[NSMutableArray<Repo *> alloc] init];
  }
  return self;
}

- (void)fetchCommitsFor:(Repo *)repo {
  [_githubService fetchCommitsFor:repo :^(NSArray<CommitResponce *> * _Nullable commits) {
    [self->_presenter commitsRecieved:commits];
  } :^(NSError * _Nullable error) {
    [self->_presenter errorOccured:error.localizedDescription];
  }];
}

- (void)fetchRepos {
  [_githubService fetchRepos:^(NSArray<Repo *> * _Nullable repos) {
    self.repos = repos;
    [self->_presenter reposRecieved:repos];
  } onFailure:^(NSError *error) {
    [self->_presenter errorOccured:error.localizedDescription];
  }];
  
}

- (Repo *)getRepoAt:(NSInteger)index {
    return [_repos objectAtIndex:index];
}

@end
