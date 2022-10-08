//
//  ViewController.m
//  PocketGuthubC
//
//  Created by Timofey on 9/8/22.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "Interfaces/LoginViewController.h"
#import "Interfaces/LoginViewInputProtocol.h"
#import "../Service/AuthService.h"
#import "LoginViewConfiguratorProtocol.h"
#import "../Library/UIKit/UIViewController + UIAlertController.h"
#import "../Library/Constants/UIColorConstants.h"

@interface LoginViewController()
@property (nonatomic, strong) UIImageView *logoView;
@property (nonatomic, strong) UIButton *signInButton;
@end

@implementation LoginViewController

typedef CGFloat Constants NS_TYPED_ENUM;
Constants const topLogoMult = 0.234;
Constants const horizontalLogoMult = 0.164;
Constants const horizontalFormMult = 0.167;
Constants const topFormMult = 0.088;

- (UIButton *)signInButton {
  if (_signInButton == nil) {
    _signInButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _signInButton.backgroundColor = [UIColor signInButtonColor];
    _signInButton.layer.cornerRadius = 5;
    [_signInButton setTitle:@"Sign in" forState:UIControlStateNormal];
    [_signInButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [_signInButton addTarget:self action:@selector(signInTouched) forControlEvents:UIControlEventTouchUpInside];
  }
  return  _signInButton;
}

-(id)init {
  if (self = [super init]) {
    self.configurator = [LoginViewConfigurator alloc];
    [_configurator configure:self];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor githubBg];
  [self setupElements];
}

-(void) setupElements {
  [self setupLogo];
  [self setupConstraints];
}

-(void) signInTouched {
  [self.presenter loginButtonTouched];
}

-(void) setupLogo {
  self.logoView = UIImageView.new;
  self.logoView.image = [UIImage imageNamed:@"logo"];
  self.logoView.contentMode = UIViewContentModeScaleAspectFit;
}

-(void) setupConstraints {
  CGFloat width = self.view.bounds.size.width;
  CGFloat height = self.view.bounds.size.height;
  
  
  UIView *superview = self.view;
  
  self.logoView.translatesAutoresizingMaskIntoConstraints = FALSE;
  self.signInButton.translatesAutoresizingMaskIntoConstraints = FALSE;
  
  [self.view addSubview: self.logoView];
  
  [self.logoView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top
      .equalTo(superview.mas_top)
      .with.offset(height * topLogoMult);
    make.centerX
      .equalTo(superview.mas_centerX);
    make.height.width.equalTo(@(width - width * horizontalLogoMult * 2));
  }];
  
  [self.view addSubview: self.signInButton];
  
  
  [self.signInButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top
      .equalTo(self.logoView.mas_bottom)
      .with.offset(height * topFormMult);
    make.centerX.equalTo(superview);
    make.height.equalTo(@30);
    make.width
      .equalTo(self.logoView)
      .with.offset(30);
  }];
}

- (void)showAlert:(NSString *)title :(NSString *)message {
  [self showAlertWith:title :message];
}
  
@end
