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

- (void)fetchCommitsFor:(Repo *)repo {
  
}

- (void)fetchRepos {
  NSArray<Repo *> *repos = @[
    [[Repo alloc] templateRepo],
    [[Repo alloc] templateRepo],
    [[Repo alloc] templateRepo],
    [[Repo alloc] templateRepo],
    [[Repo alloc] templateRepo],
    [[Repo alloc] templateRepo],
    [[Repo alloc] templateRepo],
    [[Repo alloc] templateRepo]
  ];
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    [self->_presenter reposRecieved:repos];
  });
}

- (Repo *)getRepoAt:(NSInteger)index {
  return [[Repo alloc] templateRepo];
}

@end
