//
//  VIPER Protocols.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef VIPER_Protocols_h
#define VIPER_Protocols_h


#endif /* VIPER_Protocols_h */

#import "Entity/CommitCellViewData.h"
#import "RepoListViewController.h"

@class RepoListViewController;

@protocol RepoListViewInput
@required
-(void)updateList:(NSArray<RepoCellViewData*> *)viewDatas;
-(void)showError:(NSString *)error;
@end

@protocol RepoListViewOutput
@required
-(void)viewDidLoad;
-(void)itemTapped:(NSInteger)index;
-(RepoCellViewData *)getViewDataFor:(NSInteger)index;
@end

@protocol RepoListRouter
@required
-(void)openCommitsWith:(NSArray<CommitCellViewData *> *)viewDatas;
@end

@protocol RepoListConfiguratorProtocol
-(void)configureWith:(RepoListViewController *)view;
@end
