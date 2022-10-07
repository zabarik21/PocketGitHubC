//
//  UIViewController + UIAlertController.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "UIViewController + UIAlertController.h"


@implementation UIViewController (alertExtension)

- (void)showAlertWith:(NSString *)title :(NSString *)message {
  dispatch_async(dispatch_get_main_queue(), ^{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                               message:message
                               preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:true completion:nil];
  });
}

@end
