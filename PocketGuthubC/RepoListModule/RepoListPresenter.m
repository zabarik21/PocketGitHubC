//
//  RepoListPresenter.m
//  PocketGuthubC
//
//  Created by Timofey on 8/10/2022.
//

#import <Foundation/Foundation.h>
#import "RepoListPresenter.h"


@interface RepoListPresenter ()
@property (nonatomic, strong) NSMutableArray<RepoCellViewData *> *viewData;
@property (weak, nonatomic) id<RepoListViewInput> repoView;
@end


@implementation RepoListPresenter

- (id)initWithView:(id<RepoListViewInput>)view {
  if (self = [super init]) {
    _repoView = view;
  }
  return self;
}

- (NSMutableArray<RepoCellViewData *> *)viewData {
  if (_viewData == nil) {
    _viewData = [[NSMutableArray<RepoCellViewData *> alloc] init];
  }
  return _viewData;
}

- (void)commitsRecieved:(NSArray<CommitResponce *> *)commits {
  [_repoView toggleActivityIndicatorTo:false];
  NSMutableArray<CommitCellViewData *> *commitData = [[NSMutableArray alloc] init];
  for (CommitResponce* responce in commits) {
    [commitData addObject:[[CommitCellViewData alloc] initWith:responce]];
  }
  [_router openCommitsWith:commitData];
}

- (void)errorOccured:(NSString *)error { 
  [_repoView showError:error];
}

- (void)reposRecieved:(NSArray<Repo *> *)repos {
  [_repoView toggleActivityIndicatorTo:false];    
  for (Repo* repo in repos) {
    RepoCellViewData *data = [[RepoCellViewData alloc] initWith:repo];
    [self.viewData addObject:data];
  }
  [_repoView updateList:_viewData];
}

- (NSInteger)getCellsCount { 
  return [_viewData count];
}

- (RepoCellViewData *)getViewDataFor:(NSInteger)index { 
  return [_viewData objectAtIndex:index];
}

- (void)itemTapped:(NSInteger)index {
  [_repoView toggleActivityIndicatorTo:true];
  Repo* repo = [_interactor getRepoAt:index];
  [_interactor fetchCommitsFor:repo];
}

- (void)viewDidLoad {
  [_repoView toggleActivityIndicatorTo:true];
  [_interactor fetchRepos];
}

@end
