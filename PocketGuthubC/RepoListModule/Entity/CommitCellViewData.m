//
//  CommitCellViewData.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "CommitCellViewData.h"
#import "../../Library/Foundation/NSString/NSString + Prefix.h"

@implementation CommitCellViewData
-(id)initWith:(CommitResponce *)responce {
  if (self = [super init]) {
    self.date = [responce.commit.committer.date prefix:10];
    self.commitDescription = responce.commit.message;
    self.hashString = [responce.sha prefix:6];
    self.username = responce.commit.committer.name;
  }
  return self;
}
@end
