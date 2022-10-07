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




@implementation LoginInteractor

-(instancetype)initWithPresenter:(id<LoginInteractorOutputProtocol>)presenter {
  self = [super init];
  if (self) {
    _presenter = presenter;
  }
  return self;
}

-(void)authenticationSucceed {
  [_presenter authenticatedSuccessful];
};

-(void)startAuthentication {
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
  [self authenticationSucceed];
});
  
  
  
}

@end
