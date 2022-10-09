//
//  CommitCell.m
//  PocketGuthubC
//
//  Created by Timofey on 9/10/2022.
//

#import <Foundation/Foundation.h>
#import "CommitCell.h"
#import "UIColorConstants.h"
#import "UILabel + init.h"
#import "Masonry.h"

@interface CommitCell ()
@property (strong, nonatomic) UILabel *descriptionLabel;
@property (strong, nonatomic) UILabel *usernameLabel;
@property (strong, nonatomic) UILabel *hashLabel;
@property (strong, nonatomic) UILabel *dateLabel;
-(void)updateUIWith:(CommitCellViewData *)viewData;
-(void)setupElements;
-(id)init;
@end

@implementation CommitCell

- (UILabel *)descriptionLabel {
  if (_descriptionLabel == nil) {
    _descriptionLabel = [[UILabel alloc]
                         initWithText:@"Commit message"
                         font:[UIFont systemFontOfSize:14 weight:UIFontWeightSemibold]
                         textColor:[UIColor whiteColor]
    ];
  }
  return _descriptionLabel;
}

- (UILabel *)usernameLabel {
  if (_usernameLabel == nil) {
    _usernameLabel = [[UILabel alloc]
                         initWithText:@"Username"
                         font:[UIFont systemFontOfSize:15 weight:UIFontWeightSemibold]
                         textColor:[UIColor repoCellUsernameTextColor]
    ];
  }
  return _usernameLabel;
}

- (UILabel *)hashLabel {
  if (_hashLabel == nil) {
    _hashLabel = [[UILabel alloc]
                         initWithText:@"hhhhhh"
                         font:[UIFont systemFontOfSize:12 weight:UIFontWeightSemibold]
                         textColor:[UIColor repoCellUsernameTextColor]
    ];
  }
  return _hashLabel;
}

- (UILabel *)dateLabel {
  if (_dateLabel == nil) {
    _dateLabel = [[UILabel alloc]
                         initWithText:@"02.02.02"
                         font:[UIFont systemFontOfSize:12 weight:UIFontWeightSemibold]
                         textColor:[UIColor repoCellUsernameTextColor]
    ];
  }
  return _dateLabel;
}

+ (NSString *)reuseId {
  return @"CommitCell";
}

- (void)setViewData:(CommitCellViewData *)viewData {
  _viewData = viewData;
  [self updateUIWith:viewData];
}

-(id)init {
  self.backgroundColor = [UIColor repoCellBg];
  [self setupElements];
  self.layer.cornerRadius = 5;
  return self;
}

- (void)updateUIWith:(CommitCellViewData *)viewData {
  _descriptionLabel.text = viewData.commitDescription;
  _usernameLabel.text = viewData.username;
  _hashLabel.text = viewData.hashString;
  _dateLabel.text = viewData.date;
}

-(void)setupElements {
  
  [self addSubview:self.usernameLabel];
  
  [_usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.leading.equalTo(self).offset(12.0);
    make.bottom.equalTo(self).offset(-12.0);
  }];
  
  [self addSubview:self.descriptionLabel];
  
  [_descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self).offset(12.0);
    make.leading.equalTo(self).offset(12.0);
    make.trailing.equalTo(self).offset(-12.0);
  }];
  
  UIStackView *stack = [[UIStackView alloc] initWithArrangedSubviews:@[
    self.dateLabel,
    self.hashLabel
  ]];
  
  stack.axis = UILayoutConstraintAxisHorizontal;
  stack.spacing = 14;
  stack.distribution = UIStackViewDistributionEqualSpacing;
  
  [self addSubview:stack];
  
  [stack mas_makeConstraints:^(MASConstraintMaker *make) {
    make.trailing.equalTo(self).offset(-12.0);
    make.bottom.equalTo(self).offset(-12.0);
  }];
}


@end
