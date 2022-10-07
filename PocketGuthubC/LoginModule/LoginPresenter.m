//
//  LoginPresenter.m
//  PocketGuthubC
//
//  Created by Timofey on 9/8/22.
//

#import <Foundation/Foundation.h>
#import "Interfaces/LoginInteractorInputProtocol.h"
#import "Interfaces/LoginInteractorOutputProtocol.h"
#import "Interfaces/LoginViewInputProtocol.h"
#import "Interfaces/LoginViewPresenter.h"
#import "../Library/UIKit/UIViewController + UIAlertController.h"

@implementation LoginViewPresenter

-(instancetype)initWithView:(id<LoginViewInputProtocol>)loginView {
  if (self = [super init]) {
    _view = loginView;
  }
  return self;
}

- (void)loginButtonTouched {
  [_interactor startAuthentication];
}

- (void)authenticatedFailedWithError:(NSError *)error {
  [_view showAlert
   :@"Error"
   :error.localizedDescription
  ];
}

- (void)authenticatedSuccessful {
  [_view showAlert
   :@"Please wait"
   :@"You will be logged in a few seconds"
  ];
  [self.router toRepoList];
}

@end
