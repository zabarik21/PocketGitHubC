//
//  MainCoordinator.h
//  PocketGuthubC
//
//  Created by Timofey on 9/10/2022.
//

#ifndef MainCoordinator_h
#define MainCoordinator_h


#endif /* MainCoordinator_h */
#import <UIKit/UIKit.h>

@interface MainCoordinator : NSObject
@property (strong, nonatomic) UINavigationController *nav;
-(id)init;
-(void)start;
-(void)toRepoList;
+ (instancetype)shared;
@end
