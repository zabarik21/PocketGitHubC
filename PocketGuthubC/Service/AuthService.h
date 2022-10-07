//
//  AuthService.h
//  PocketGuthubC
//
//  Created by Timofey on 10/8/22.
//

#ifndef AuthService_h
#define AuthService_h


#endif /* AuthService_h */

@interface AuthService : NSObject
 
+ (instancetype)shared;

-(void) tryOauth;

-(void) handleUrl:(NSURL*)url;

@end
