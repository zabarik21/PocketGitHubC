//
//  CommitListView.m
//  PocketGuthubC
//
//  Created by Timofey on 9/10/2022.
//

#import <Foundation/Foundation.h>
#import "CommitListView.h"
#import "UIColorConstants.h"
#import "CommitCell.h"
#import "RepoHeaderView.h"
#import "RepoListConstants.h"

@interface CommitListView ()
-(void)setupCollectionView;
@end


@implementation CommitListView

- (void)setViewData:(NSArray<CommitCellViewData *> *)viewData {
  _viewData = viewData;
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.collectionView reloadData];
  });
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupCollectionView];
}

- (void)setupCollectionView {
  self.collectionView.backgroundColor = [UIColor githubBg];
  [self.collectionView registerClass:CommitCell.class forCellWithReuseIdentifier:[CommitCell reuseId]];
  [self.collectionView
   registerClass:RepoHeaderView.self
   forSupplementaryViewOfKind: UICollectionElementKindSectionHeader withReuseIdentifier:[RepoHeaderView reuseId]
  ];
}

// MARK: - Data
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return _viewData.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}
// MARK: - Delegate
-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  CommitCell *cell = [[collectionView dequeueReusableCellWithReuseIdentifier:[CommitCell reuseId] forIndexPath:indexPath] init];
  cell.viewData = [_viewData objectAtIndex:indexPath.row];
  return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
  if (kind == UICollectionElementKindSectionHeader) {
    RepoHeaderView *header = [
      collectionView
      dequeueReusableSupplementaryViewOfKind:kind
      withReuseIdentifier:[RepoHeaderView reuseId]
      forIndexPath:indexPath
    ];
    [header setTitle:@"Commmits"];
    return header;
  }
  return [UICollectionReusableView alloc];
}

// MARK: - Layout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
  UIEdgeInsets insets = UIEdgeInsetsMake(10.0, horizontalPadding, 20.0, -horizontalPadding);
  return insets;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  CGFloat width = collectionView.bounds.size.width;
  return CGSizeMake(width - horizontalPadding * 2, 80);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
  return 8;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
  return CGSizeMake(self.view.bounds.size.width, headerHeight);
}

@end
