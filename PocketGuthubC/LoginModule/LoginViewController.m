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
#import "UIColor/UIColorConstants.h"
#import "LoginViewConfiguratorProtocol.h"


@implementation LoginViewController

typedef CGFloat Constants NS_TYPED_ENUM;
Constants const topLogoMult = 0.234;
Constants const horizontalLogoMult = 0.164;
Constants const horizontalFormMult = 0.167;
Constants const topFormMult = 0.088;

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
  [self setupButton];
  [self setupConstraints];
}

-(void) setupButton {
  self.signInButton = [UIButton buttonWithType:UIButtonTypeSystem];
  self.signInButton.backgroundColor = [UIColor signInButtonColor];
  self.signInButton.layer.cornerRadius = 5;
  [self.signInButton setTitle:@"Sign in" forState:UIControlStateNormal];
  [self.signInButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
  [self.signInButton addTarget:self action:@selector(signInTouched) forControlEvents:UIControlEventTouchUpInside];
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
  dispatch_async(dispatch_get_main_queue(), ^{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                               message:message
                               preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
  });
}

@end
