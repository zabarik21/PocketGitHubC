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
+ (instancetype _Nonnull)shared;
- (void)fetchRepos
  :(void (^_Nonnull)(NSArray<Repo *> *_Nullable))success
  onFailure:(NSError *_Nullable (^_Nonnull)(void))failure;
- (void)fetchCommitsFor
  :(Repo *_Nonnull)repo
  :(void (^_Nullable)(NSArray<CommitResponce *>*_Nullable))onSuccess
  :(void (^_Nullable)(NSError *_Nullable))onFailure;
@end
