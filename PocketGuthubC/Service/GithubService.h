//
//  GithubService.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef GithubService_h
#define GithubService_h


#endif /* GithubService_h */

 

struct Repo {
  
};

@interface GithubService : NSObject

+ (instancetype)shared;
- (void)fetchRepos:(void (^)(void))completion;
- (void)fetchCommitsFor:(void)repo :(void (^)(void))completion;

@end
