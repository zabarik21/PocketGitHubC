//
//  LoginViewPresenter.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef LoginViewPresenter_h
#define LoginViewPresenter_h


#endif /* LoginViewPresenter_h */

#import <Foundation/Foundation.h>
#import "LoginViewOutputProtocol.h"
#import "LoginViewInputProtocol.h"
#import "LoginViewRouterProtocol.h"
#import "LoginInteractorInputProtocol.h"
#import "LoginInteractorOutputProtocol.h"

@interface LoginViewPresenter: NSObject<LoginViewOutputProtocol, LoginInteractorOutputProtocol>
@property (weak, nonatomic) id<LoginViewInputProtocol> view;
@property (strong, nonatomic) id<LoginInteractorInputProtocol> interactor;
@property (strong, nonatomic) id<LoginViewRouterProtocol> router;
-(void) loginButtonTouched;
-(void) authenticatedSuccessful;
-(void) authenticatedFailedWithError:(NSError *) error;
-(instancetype)initWithView:(id<LoginViewInputProtocol>)loginView;
@end

