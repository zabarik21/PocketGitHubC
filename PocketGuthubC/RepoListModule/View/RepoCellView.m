//
//  RepoCellView.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "RepoCellView.h"
#import <UIKit/UIKit.h>
#import "../../Library/Constants/UIColorConstants.h"
#import "../../Library/UIKit/View/CircleImageView.h"
#import "Masonry.h"
#import <SDWebImage/SDWebImage.h>

@interface RepoCellView ()
@property (strong, nonatomic) CircleImageView *userImageView;
@property (strong, nonatomic) UILabel *usernameLabel;
@property (strong, nonatomic) UILabel *reponameLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;
@property (strong, nonatomic) RepoCountView *forksCountView;
@property (strong, nonatomic) RepoCountView *viewsCountView;
-(void) updateUI:(RepoCellViewData *)viewData;
@end

@implementation RepoCellView

- (void)setViewData:(RepoCellViewData *)viewData {
  if (_viewData != viewData) {
    _viewData = viewData;
    [self updateUI:viewData];
  }
}

- (RepoCountView *)viewsCountView {
  if (_viewsCountView == nil) {
    _viewsCountView = [[RepoCountView alloc] initWithType:views];
  }
  return _viewsCountView;
}

- (RepoCountView *)forksCountView {
  if (_forksCountView == nil) {
    _forksCountView = [[RepoCountView alloc] initWithType:forks];
  }
  return _forksCountView;
}

- (UILabel *)usernameLabel {
  if (_usernameLabel == nil) {
    _usernameLabel = [[UILabel alloc] init];
    _usernameLabel.text = @"Repo owner";
    _usernameLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightSemibold];
    _usernameLabel.textColor = [UIColor repoCellUsernameTextColor];
  }
  return _usernameLabel;
}

- (UILabel *)reponameLabel {
  if (_reponameLabel == nil) {
    _reponameLabel = [[UILabel alloc] init];
    _reponameLabel.text = @"Repo";
    _reponameLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightSemibold];
    _reponameLabel.textColor = [UIColor whiteColor];
  }
  return _reponameLabel;
}

- (UILabel *)descriptionLabel {
  if (_descriptionLabel == nil) {
    _descriptionLabel = [[UILabel alloc] init];
    _descriptionLabel.text = @"Description";
    _descriptionLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightSemibold];
    _descriptionLabel.textColor = [UIColor repoCellDescriptionTextColor];
    _descriptionLabel.numberOfLines = 2;
  }
  return _descriptionLabel;
}

- (CircleImageView *)userImageView {
  if (_userImageView == nil) {
    _userImageView = [[CircleImageView new] init];
    _userImageView.backgroundColor = [UIColor whiteColor];
    _userImageView.contentMode = UIViewContentModeScaleAspectFit;
  }
  return _userImageView;
}

- (id)init {
  self.backgroundColor = [UIColor repoCellBg];
  self.layer.cornerRadius = 5;
  [self setupConstraints];
  return self;
}

+ (NSString *)reuseId {
  return @"RepoCellViewId";
}

-(void) updateUI:(RepoCellViewData *)viewData {
  _forksCountView.count = viewData.forksCount;
  _viewsCountView.count = viewData.viewsCount;
  _reponameLabel.text = viewData.reponame;
  _descriptionLabel.text = viewData.repoDescription;
  _usernameLabel.text = viewData.username;
  NSURL *url = [NSURL URLWithString:viewData.userImageString];
  if (url != nil) {
    [_userImageView sd_setImageWithURL:url];
  }
}

-(void) setupConstraints {
  
  [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.height.width.equalTo(@25);
  }];
  
  UIStackView *nameImageStack = [[UIStackView alloc] initWithArrangedSubviews:
                                 @[
    self.userImageView,
    self.usernameLabel
  ]];
  
  nameImageStack.axis = UILayoutConstraintAxisHorizontal;
  nameImageStack.spacing = 10;
  nameImageStack.alignment = UIStackViewAlignmentCenter;
  nameImageStack.distribution = UIStackViewDistributionEqualSpacing;
  
  [self addSubview:nameImageStack];
  
  [nameImageStack mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self).offset(12.0);
    make.leading.equalTo(self).offset(12.0);
    make.trailing.equalTo(self).offset(-12.0);
  }];
  
  UIStackView *nameDescriptionStack = [[UIStackView new] initWithArrangedSubviews:@[
    self.reponameLabel,
    self.descriptionLabel
  ]];
  
  nameDescriptionStack.axis = UILayoutConstraintAxisVertical;
  nameDescriptionStack.alignment = UIStackViewAlignmentLeading;
  
  [self addSubview:nameDescriptionStack];
  
  [nameDescriptionStack mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(nameImageStack.mas_bottom).offset(6.0);
    make.leading.equalTo(self).offset(12.0);
    make.trailing.equalTo(self).offset(-12.0);
  }];
  
  [self addSubview:self.viewsCountView];
  
  [_viewsCountView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.trailing.equalTo(self).offset(-12.0);
    make.bottom.equalTo(self).offset(-8.0);
    make.height.equalTo(@20.0);
    make.width.equalTo(@50.0);
  }];
  
  [self addSubview:self.forksCountView];
  
  [_forksCountView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.trailing.equalTo(_viewsCountView.mas_leadingMargin).offset(-12.0);
    make.bottom.equalTo(self).offset(-8.0);
    make.height.equalTo(@20.0);
    make.width.equalTo(@50.0);
  }];
}

@end
