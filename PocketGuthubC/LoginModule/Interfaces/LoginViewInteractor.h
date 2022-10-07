//
//  LoginViewInteractor.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef LoginViewInteractor_h
#define LoginViewInteractor_h


#endif /* LoginViewInteractor_h */

#import "AuthService.h"

@interface LoginInteractor : NSObject<LoginInteractorInputProtocol>

@property(nonatomic, strong) id<LoginInteractorOutputProtocol> presenter;
@property (nonatomic, strong) AuthService *authService;
- (void)startAuthentication;
- (void)authenticationSucceed;
-(instancetype)initWithPresenter:(id<LoginInteractorOutputProtocol>)presenter;
@end


