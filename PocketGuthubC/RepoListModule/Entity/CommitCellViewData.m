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
-(instancetype)initWith:(CommitResponce *)responce {
  if (self = [super init]) {
    self.description = responce.description;
    self.hash = [responce.sha prefix:6];
    self.username = responce.commit.committer.name;
    self.date = [responce.commit.committer.date prefix:10];
  }
  return self;
}
@end
