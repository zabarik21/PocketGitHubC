//
//  RepoCellViewData.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "RepoCellViewData.h"

@implementation RepoCellViewData

- (id)initWith:(Repo *)repo {
  if (self == [super init]) {
    self.reponame = repo.name;
    self.username = repo.owner.login;
    self.repoDescription = repo.repoDescription;
    self.userImageString = repo.owner.avatar_url;
    self.forksCount = repo.forks;
    self.viewsCount = repo.watchers;
  }
  return self;
}

@end
