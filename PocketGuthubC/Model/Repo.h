//
//  Repo.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef Repo_h
#define Repo_h

#endif /* Repo_h */
#import "RepoOwner.h"

@interface Repo : NSObject
@property (strong, nonatomic, nonnull) NSString *name;
@property (strong, nonatomic, nonnull) RepoOwner *owner;
@property (nonatomic, nonnull) NSInteger *forks;
@property (nonatomic, nonnull) NSInteger *watchers;
@property (strong, nonatomic, nullable) NSString *description;
@end
