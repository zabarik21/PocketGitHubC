//
//  LoginViewRouterProtocol.h
//  PocketGuthubC
//
//  Created by Timofey on 9/8/22.
//

#ifndef LoginViewRouterProtocol_h
#define LoginViewRouterProtocol_h


#endif /* LoginViewRouterProtocol_h */

#import "LoginViewInputProtocol.h"
#import <Foundation/Foundation.h>
#import "MainCoordinator.h"

@protocol LoginViewRouterProtocol <NSObject>
@required
-(void) toRepoList;
@end

@interface LoginViewRouter : NSObject<LoginViewRouterProtocol>
@property (weak, nonatomic) MainCoordinator *coordinator;
-(void) toRepoList;
@end
