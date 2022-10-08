//
//  RepoCountView.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RepoCountView.h"
#import "Masonry.h"
#import "../../Library/Constants/UIColorConstants.h"

@interface RepoCountView ()
@property RepoCountType type;
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) UIImageView *countImage;
- (void)udpateCount:(NSInteger)count;
@end

@implementation RepoCountView

- (void)setCount:(NSInteger)count {
  if (_count != count) {
    _count = count;
    [self udpateCount:count];
  }
}

- (UILabel *)countLabel {
  if (_countLabel == nil) {
    _countLabel = [[UILabel alloc] init];
    _countLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightBold];
    _countLabel.textColor = [UIColor repoCellUsernameTextColor];
  }
  return _countLabel;
}

- (UIImageView *)countImage {
  if (_countImage == nil) {
    _countImage = [[UIImageView alloc] init];
    _countImage.image = [UIImage imageNamed:[self getImageName]];
    _countImage.contentMode = UIViewContentModeScaleAspectFit;
  }
  return _countImage;
}

- (id)initWithType:(RepoCountType)type {
  if (self = [super init]) {
    self.type = type;
    [self setupConstraints];
  }
  return self;
}

- (void)udpateCount:(NSInteger)count {
  dispatch_async(dispatch_get_main_queue(), ^{
    if (count > 9999) {
      self.countLabel.text = @"9999+";
    } else {
      self.countLabel.text = [@(count) stringValue];
    }
  });
}

- (void)setupConstraints {
  [self addSubview:_countLabel];
  
  [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.trailing.top.bottom.equalTo(self);
  }];
  
  [self addSubview:_countImage];
  
  [_countImage mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(@12);
    make.height.equalTo(@22);
    make.leading.equalTo(self);
    make.centerY.equalTo(self);
  }];
}

-(NSString *)getImageName {
  switch (_type) {
    case forks:
      return @"forks";
    case views:
      return @"eye";
  }
}

@end
