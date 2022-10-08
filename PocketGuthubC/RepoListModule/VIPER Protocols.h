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
#import "../Model/Repo.h"
#import "../Model/CommitResponce.h"
#import "RepoCellViewData.h"

@class RepoListViewController;

@protocol RepoListViewInput <NSObject>
@required
-(void)updateList:(NSArray<RepoCellViewData*> *)viewDatas;
-(void)showError:(NSString *)error;
-(void)toggleActivityIndicatorTo:(BOOL)status;
@end

@protocol RepoListViewOutput <NSObject>
@required
-(void)viewDidLoad;
-(void)itemTapped:(NSInteger)index;
-(RepoCellViewData *)getViewDataFor:(NSInteger)index;
-(NSInteger)getCellsCount;
@end

@protocol RepoListRouterProtocol <NSObject>
@required
-(void)openCommitsWith:(NSArray<CommitCellViewData *> *)viewDatas;
@end

@protocol RepoListConfiguratorProtocol <NSObject>
@required
-(void)configureWith:(RepoListViewController *)view;
@end

@protocol RepoListInteractorOutput <NSObject>
-(void)reposRecieved:(NSArray<Repo *>*)repos;
-(void)commitsRecieved:(NSArray<CommitResponce *>*)commits;
-(void)errorOccured:(NSString *)error;
@end

@protocol RepoListInteractorInput <NSObject>
@required
-(void)fetchCommitsFor:(Repo *)repo;
-(void)fetchRepos;
-(Repo *)getRepoAt:(NSInteger)index;
@end
