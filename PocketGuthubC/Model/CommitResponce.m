//
//  CommitResponce.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "CommitResponce.h"





@implementation CommitResponce
- (id)initFromDict:(NSDictionary *)dict {
  NSDictionary *commitDict = dict[@"commit"];
  NSDictionary *authorDict = commitDict[@"author"];
  NSString *message = commitDict[@"message"];
  NSString *sha = dict[@"sha"];
  NSString *date = authorDict[@"date"];
  NSString *name = authorDict[@"name"];
  CommitAuthor *commiter = [[CommitAuthor alloc] init];
  commiter.date = date;
  commiter.name = name;
  Commit *commit = [[Commit alloc] init];
  commit.committer = commiter;
  commit.message = message;
  self.commit = commit;
  self.sha = sha;
  return self;
}
@end
