//
//  LoginInteractor.m
//  PocketGuthubC
//
//  Created by Timofey on 9/8/22.
//

#import <Foundation/Foundation.h>
#import "LoginInteractorInputProtocol.h"
#import "LoginInteractorOutputProtocol.h"
#import "Interfaces/LoginViewInteractor.h"
#import "../Service/AuthService.h"
#import "../Service/AuthConstants.h"

@interface LoginInteractor()
-(void)authenticationSucceed;
@end


@implementation LoginInteractor

-(instancetype)initWithPresenter:(id<LoginInteractorOutputProtocol>)presenter {
  self = [super init];
  if (self) {
    _presenter = presenter;
    _authService = AuthService.shared;
  }
  return self;
}

-(void)authenticationSucceed {
  [_presenter authenticatedSuccessful];
}

-(void)startAuthentication {
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
  [self.authService tryOauth];
  [NSNotificationCenter.defaultCenter
   addObserver:self
   selector:@selector(authenticationSucceed)
   name: clientIdKey
     object:self
  ];
});
  
}

@end
