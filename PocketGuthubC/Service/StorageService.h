//
//  StorageService.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef StorageService_h
#define StorageService_h


#endif /* StorageService_h */


@interface StorageService : NSObject
+ (instancetype)shared;
-(void)saveToken:(NSString *_Nonnull)token;
-(NSString* _Nullable)getToken;
@end
