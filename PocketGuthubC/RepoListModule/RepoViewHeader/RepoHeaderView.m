//
//  RepoHeaderView.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "RepoHeaderView.h"
#import "Masonry.h"

@interface RepoHeaderView()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation RepoHeaderView

- (UILabel *)titleLabel {
  if (_titleLabel == nil) {
    _titleLabel = [UILabel alloc];
    _titleLabel.font = [UIFont systemFontOfSize:30 weight:UIFontWeightBold];
    _titleLabel.textColor = UIColor.whiteColor;
  }
  return _titleLabel;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  [self setupConstraints];
}

+ (NSString *)reuseId {
  return @"RepoHeaderViewId";
}
- (void)setTitle:(NSString *)title {
  dispatch_async(dispatch_get_main_queue(), ^{
    _titleLabel.text = title;
  });
}

-(void)setupConstraints {
  _titleLabel.translatesAutoresizingMaskIntoConstraints = false;
  
  [self addSubview:_titleLabel];
  
  [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerY.equalTo(self);
    make.leading.equalTo(self);
    make.trailing.equalTo(self);
  }];
}

@end
