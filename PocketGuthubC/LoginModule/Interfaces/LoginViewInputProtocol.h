//
//  LoginViewInputProtocol.h
//  PocketGuthubC
//
//  Created by Timofey on 9/8/22.
//

#ifndef LoginViewInputProtocol_h
#define LoginViewInputProtocol_h


#endif /* LoginViewInputProtocol_h */

#import "LoginViewInputProtocol.h"
#import <Foundation/Foundation.h>

@protocol LoginViewInputProtocol  <NSObject>
@required
-(void) showAlert:(NSString*)title :(NSString*)message;

@end
