//
//  GithubService.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef GithubService_h
#define GithubService_h


#endif /* GithubService_h */

#import "Repo.h"
#import "CommitResponce.h"
 
@interface GithubService : NSObject
//Result<[CommitApiResponce], Error>) -> Void
+ (instancetype)shared;
- (void)fetchRepos
  :(NSArray<Repo *> *_Nullable (^)(void))onSuccess
  :(NSError *_Nullable (^)(void))onFailure;
- (void)fetchCommitsFor
  :(Repo *)repo
  :(void (^)(NSArray<CommitResponce *>*_Nullable))onSuccess
  :(void (^)(NSError *_Nullable))onFailure;
@end
