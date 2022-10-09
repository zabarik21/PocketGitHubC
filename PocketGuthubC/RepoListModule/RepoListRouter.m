//
//  RepoListRouter.m
//  PocketGuthubC
//
//  Created by Timofey on 8/10/2022.
//

#import <Foundation/Foundation.h>
#import "RepoListRouter.h"
#import "CommitListView.h"

@implementation RepoListRouter

- (void)openCommitsWith:(NSArray<CommitCellViewData *> *)viewDatas {
  UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout alloc];
  CommitListView *commitList = [[CommitListView alloc] initWithCollectionViewLayout:layout];
  commitList.viewData = viewDatas;
  [_view.navigationController pushViewController:commitList animated:true];
}

@end
