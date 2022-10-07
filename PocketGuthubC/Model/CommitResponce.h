//
//  CommitResponce.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef CommitResponce_h
#define CommitResponce_h


#endif /* CommitResponce_h */
#import "Commit.h"

@interface CommitResponce : NSObject
@property (strong, nonatomic, nonnull) NSString *sha;
@property (strong, nonatomic, nonnull) Commit *commit;
@end
