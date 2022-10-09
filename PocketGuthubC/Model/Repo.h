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

//@interface RepoCodingKeys : NSObject
//extern NSString const *forksKey;
//extern NSString const *watchersKey;
//extern NSString const *ownerKey;
//extern NSString const *nameKey;
//extern NSString const *descriptionKey;
//@end
//
//@implementation RepoCodingKeys
//NSString const *forksKey = @"forks";
//NSString const *watchersKey = @"watchers";
//NSString const *ownerKey = @"owner";
//NSString const *nameKey = @"name";
//NSString const *descriptionKey = @"description";
//@end


@interface Repo : NSObject
@property (strong, nonatomic, nonnull) NSString *name;
@property (strong, nonatomic, nonnull) RepoOwner *owner;
@property (strong, nonatomic, nonnull) NSNumber *forks;
@property (strong, nonatomic, nonnull) NSNumber *watchers;
@property (strong, nonatomic, nullable) NSString *repoDescription;
-(instancetype _Nonnull)templateRepo;
-(id _Nullable)initFromDict:(NSDictionary *_Nonnull)dict;
@end
