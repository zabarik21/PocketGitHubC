//
//  Repo.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "Repo.h"


@implementation Repo
-(instancetype)templateRepo {
  Repo *repo = [Repo alloc];
  RepoOwner *owner = [RepoOwner alloc];
  owner.avatar_url = @"s";
  owner.login = @"Login";
  repo.repoDescription = @"Description label";
  repo.name = @"Repo name";
  repo.owner = owner;
  repo.forks = @10;
  repo.watchers = @10;
  return repo;
}
- (id)initFromDict:(NSDictionary *)dict {
  RepoOwner *owner = [[RepoOwner alloc] init];
  NSDictionary *ownerDict = dict[@"owner"];
  NSString *login = ownerDict[@"login"];
  NSString *avararUlr = ownerDict[@"avatar_url"];
  owner.login = login;
  owner.avatar_url = avararUlr;
  self.owner = owner;
  NSString *description = dict[@"description"];
  NSString *name = dict[@"name"];
  NSNumber *forks = dict[@"forks"];
  NSNumber *watchers = dict[@"watchers"];
  if ([description isMemberOfClass:NSNull.class]) {
    self.repoDescription = @"";
  } else {
    self.repoDescription = description;
  }
  self.name = name;
  self.forks = forks;
  self.watchers = watchers;
  return self;
}
@end
