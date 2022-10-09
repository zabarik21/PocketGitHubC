//
//  UINavigationController + Transparent.m
//  PocketGuthubC
//
//  Created by Timofey on 9/10/2022.
//

#import <Foundation/Foundation.h>
#import "UINavigationController + Transparent.h"

@implementation UINavigationController (Transparent)

- (void)makeTransparentNavBar {
  self.navigationBar.shadowImage = [[UIImage alloc] init];
  [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
  self.navigationBar.translucent = true;
}

@end
