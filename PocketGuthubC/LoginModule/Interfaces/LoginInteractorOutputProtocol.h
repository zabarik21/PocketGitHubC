//
//  LoginInteractorOutputProtocol.h
//  PocketGuthubC
//
//  Created by Timofey on 9/8/22.
//

#ifndef LoginInteractorOutputProtocol_h
#define LoginInteractorOutputProtocol_h


#endif /* LoginInteractorOutputProtocol_h */

#import "LoginViewInputProtocol.h"
#import <Foundation/Foundation.h>

@protocol LoginInteractorOutputProtocol <NSObject>
@required
-(void) authenticatedSuccessful;
-(void) authenticatedFailedWithError:(NSError *) error;
@end
