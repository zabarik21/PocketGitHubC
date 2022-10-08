//
//  RepoListViewController.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef RepoListViewController_h
#define RepoListViewController_h


#endif /* RepoListViewController_h */
#import <UIKit/UIKit.h>
#import "RepoViewHeader/RepoHeaderView.h"
#import "Entity/RepoCellViewData.h"

#import "VIPER Protocols.h"

@interface RepoListViewController : UICollectionViewController<RepoListViewInput, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) id<RepoListViewOutput> presenter;
-(instancetype)initWithLayout:(UICollectionViewLayout *)layout;
@end
