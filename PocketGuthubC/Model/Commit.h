//
//  Commit.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef Commit_h
#define Commit_h


#endif /* Commit_h */
#import "CommitAuthor.h"

@interface Commit : NSObject
@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) CommitAuthor *committer;
@end
