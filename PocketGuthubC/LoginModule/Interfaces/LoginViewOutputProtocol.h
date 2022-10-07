//
//  LoginViewOutputProtocol.h
//  PocketGuthubC
//
//  Created by Timofey on 9/8/22.
//

#ifndef LoginViewOutputProtocol_h
#define LoginViewOutputProtocol_h


#endif /* LoginViewOutputProtocol_h */

#import "LoginViewInputProtocol.h"
#import <Foundation/Foundation.h>

@protocol LoginViewOutputProtocol <NSObject>


@required
@property (nonatomic, weak) id<LoginViewInputProtocol> view;
-(void) loginButtonTouched;

@end

