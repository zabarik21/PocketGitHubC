//
//  ViewController.h
//  PocketGuthubC
//
//  Created by Timofey on 9/8/22.
//

#import <UIKit/UIKit.h>

#import "LoginViewOutputProtocol.h"
#import "LoginViewInputProtocol.h"
#import "LoginViewConfiguratorProtocol.h"
#import "MainCoordinator.h"


@interface LoginViewController: UIViewController<LoginViewInputProtocol>
@property (nonatomic, strong) NSObject<LoginViewOutputProtocol> *presenter;
@property (nonatomic, strong) NSObject<LoginViewConfiguratorProtocol> *configurator;
-(id)initWithCoordinator:(MainCoordinator *)coordinator;
@end

