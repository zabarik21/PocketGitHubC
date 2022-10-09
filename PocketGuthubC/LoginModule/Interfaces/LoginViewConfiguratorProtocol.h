//
//  LoginViewConfiguratorProtocol.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//



#ifndef LoginViewConfiguratorProtocol_h
#define LoginViewConfiguratorProtocol_h


#endif /* LoginViewConfiguratorProtocol_h */


//#import "../LoginViewController.h"
#import "MainCoordinator.h"

@class LoginViewController;

@protocol LoginViewConfiguratorProtocol 
@required
-(void)configure:(LoginViewController *)view withCoordinator:(MainCoordinator *)coordinator;
@end


@interface LoginViewConfigurator : NSObject<LoginViewConfiguratorProtocol>
@end
