//
//  LoginInteractorOutputProtocol.h
//  PocketGuthubC
//
//  Created by Timofey on 9/8/22.
//

#ifndef LoginInteractorOutputProtocol_h
#define LoginInteractorOutputProtocol_h


#endif /* LoginInteractorOutputProtocol_h */

#import <Foundation/Foundation.h>
#import "LoginViewInputProtocol.h"

@protocol LoginInteractorOutputProtocol <NSObject>
@required
-(void) authenticatedSuccessful;
-(void) authenticatedFailedWithError:(NSError *) error;
@end
