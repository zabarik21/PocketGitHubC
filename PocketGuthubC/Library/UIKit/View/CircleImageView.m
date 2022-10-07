//
//  CircleImageView.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "CircleImageView.h"

@implementation CircleImageView

- (void)layoutSubviews {
  [super layoutSubviews];
  self.layer.masksToBounds = true;
  self.layer.cornerRadius = self.bounds.size.height / 2;
}

@end
