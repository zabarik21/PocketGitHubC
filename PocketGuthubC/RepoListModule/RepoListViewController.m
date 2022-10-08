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
#import "RepoListConstants.h"
#import "RepoListConfigurator.h"

@interface RepoListViewController ()
@property (strong, nonatomic) NSObject<RepoListConfiguratorProtocol>* configurator;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@end

@implementation RepoListViewController

- (UIActivityIndicatorView *)activityIndicator {
  if (_activityIndicator == nil) {
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _activityIndicator.hidesWhenStopped = true;
  }
  return _activityIndicator;
}

- (instancetype)initWithLayout:(UICollectionViewLayout *)layout {
  if (self = [super initWithCollectionViewLayout:layout]) {
    _configurator = [RepoListConfigurator alloc];
    [_configurator configureWith:self];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupCollectionView];
  [_presenter viewDidLoad];
}

-(void)setupCollectionView {
  [self.view addSubview:self.activityIndicator];
  _activityIndicator.center = self.view.center;
  
  self.collectionView.backgroundColor = [UIColor githubBg];
  [self.collectionView
   registerClass:RepoCellView.self
   forCellWithReuseIdentifier:[RepoCellView reuseId]
  ];
  [self.collectionView
   registerClass:RepoHeaderView.self
   forSupplementaryViewOfKind: UICollectionElementKindSectionHeader withReuseIdentifier:[RepoHeaderView reuseId]
  ];
  
}

-(void)toggleActivityIndicatorTo:(BOOL)status {
  if (status) {
    [_activityIndicator startAnimating];
  } else {
    [_activityIndicator stopAnimating];
  }
}

-(void)updateList:(NSArray<RepoCellViewData*> *)viewDatas {
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.collectionView reloadData];
  });
}

-(void)showError:(NSString *)error {
  [self showAlertWith:@"Error" :error];
}

// MARK: - DataSource

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  [_presenter itemTapped:indexPath.row];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  RepoCellView *cell = [collectionView
                        dequeueReusableCellWithReuseIdentifier:[RepoCellView reuseId]
                        forIndexPath:indexPath
  ];
  [cell init];
  cell.viewData = [_presenter getViewDataFor:indexPath.row];
  return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  NSInteger count = [_presenter getCellsCount];
  return count;
}

// MARK: - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  CGFloat width = collectionView.bounds.size.width - 15 * 2;
  return CGSizeMake(width, cellHeight);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
  return 20;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
  if (kind == UICollectionElementKindSectionHeader) {
    RepoHeaderView *header = [
      collectionView
      dequeueReusableSupplementaryViewOfKind:kind
      withReuseIdentifier:[RepoHeaderView reuseId]
      forIndexPath:indexPath
    ];
    [header setTitle:headerTitle];
    return header;
  }
  return [UICollectionReusableView alloc];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
  return CGSizeMake(self.view.bounds.size.width, headerHeight);
}

@end
