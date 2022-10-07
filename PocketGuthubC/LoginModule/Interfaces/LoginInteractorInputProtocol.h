//
//  LoginInteractorInputProtocol.h
//  PocketGuthubC
//
//  Created by Timofey on 9/8/22.
//

#ifndef LoginInteractorInputProtocol_h
#define LoginInteractorInputProtocol_h


#endif /* LoginInteractorInputProtocol_h */

#import <Foundation/Foundation.h>
#import "LoginInteractorOutputProtocol.h"


@protocol LoginInteractorInputProtocol <NSObject>
@required
@property(nonatomic, strong) id<LoginInteractorOutputProtocol> presenter;
-(void) startAuthentication;
@end
