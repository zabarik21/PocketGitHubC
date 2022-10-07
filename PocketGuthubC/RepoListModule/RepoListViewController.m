//
//  RepoListViewController.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "RepoListViewController.h"
#import "VIPER Protocols.h"
#import "../Library/UIKit/UIViewController + UIAlertController.h"
#import "../Library/Constants/UIColorConstants.h"
#import "RepoViewHeader/RepoHeaderView.h"
#import "View/RepoCellView.h"

@interface RepoListViewController ()
@property (strong, nonatomic) NSObject<RepoListConfiguratorProtocol>* configurator;
@property (strong, nonatomic) NSObject<RepoListViewOutput>* presenter;
@property (strong, nonatomic) UIActivityIndicatorView* activityIndicator;
@end

@implementation RepoListViewController

- (UIActivityIndicatorView *)activityIndicator {
  if (_activityIndicator == nil) {
    _activityIndicator = [UIActivityIndicatorView.new initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _activityIndicator.center = self.view.center;
  }
  return _activityIndicator;
}


- (void)viewDidLoad {
  [super viewDidLoad];
  [_configurator configureWith:self];
  [_presenter viewDidLoad];
}

-(void)setupCollectionView {
  self.collectionView.backgroundColor = [UIColor githubBg];
//  [self.collectionView registerClass:<#(nullable Class)#> forCellWithReuseIdentifier:<#(nonnull NSString *)#>]
  [self.collectionView
   registerClass:RepoHeaderView.class\
   forSupplementaryViewOfKind: UICollectionElementKindSectionHeader withReuseIdentifier:[RepoHeaderView reuseId]];
  
}

-(void)updateList:(NSArray<RepoCellViewData*> *)viewDatas {
  
}

-(void)showError:(NSString *)error {
  [self showAlertWith:@"Error" :error];
}


@end
