//
//  LoginViewConfigurator.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "Interfaces/LoginViewConfiguratorProtocol.h"
#import "Interfaces/LoginViewPresenter.h"
#import "Interfaces/LoginViewRouterProtocol.h"
#import "Interfaces/LoginViewInteractor.h"
#import "LoginViewController.h"


@implementation LoginViewConfigurator

- (void)configure:(LoginViewController *)view {
  LoginViewPresenter *presenter = [[LoginViewPresenter new] initWithView:view];
  LoginViewRouter *router = [LoginViewRouter new];
  LoginInteractor *interactor = [[LoginInteractor new] initWithPresenter:presenter];
  
  presenter.router = router;
  presenter.interactor = interactor;
  view.presenter = presenter;
}

@end
