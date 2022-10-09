//
//  UILabel + init.m
//  PocketGuthubC
//
//  Created by Timofey on 9/10/2022.
//

#import <Foundation/Foundation.h>
#import "UILabel + init.h"

@implementation UILabel (init)

- (id)initWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color {
  if (self = [super init]) {
    self.text = text;
    self.font = font;
    self.textColor = color;
  }
  return self;
}

@end
