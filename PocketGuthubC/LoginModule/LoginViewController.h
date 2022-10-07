//
//  ViewController.h
//  PocketGuthubC
//
//  Created by Timofey on 9/8/22.
//

#import <UIKit/UIKit.h>

#import "Interfaces/LoginViewOutputProtocol.h"
#import "Interfaces/LoginViewInputProtocol.h"
#import "Interfaces/LoginViewConfiguratorProtocol.h"


@interface LoginViewController: UIViewController<LoginViewInputProtocol>
@property (nonatomic, strong) NSObject<LoginViewOutputProtocol> *presenter;
@property (nonatomic, strong) NSObject<LoginViewConfiguratorProtocol> *configurator;
@property (nonatomic, strong) UIImageView *logoView;
@property (nonatomic, strong) UIButton *signInButton;
-(void) showAlert:(NSString*)title :(NSString*)message;
@end

