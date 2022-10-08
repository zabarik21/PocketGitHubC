//
//  Repo.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "Repo.h"

@implementation Repo
@synthesize description;
-(instancetype)templateRepo {
  Repo *repo = [Repo alloc];
  RepoOwner *owner = [RepoOwner alloc];
  owner.avatar_url = @"s";
  owner.login = @"Login";
  repo.description = @"Description label";
  repo.name = @"Repo name";
  repo.owner = owner;
  repo.forks = 10;
  repo.watchers = 10;
  return repo;
}
@end
