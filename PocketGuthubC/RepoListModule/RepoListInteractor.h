//
//  RepoListInteractor.h
//  PocketGuthubC
//
//  Created by Timofey on 8/10/2022.
//

#ifndef RepoListInteractor_h
#define RepoListInteractor_h


#endif /* RepoListInteractor_h */


#import "VIPER Protocols.h"


@interface RepoListInteractor : NSObject<RepoListInteractorInput>
@property (weak, nonatomic) id<RepoListInteractorOutput> presenter;
@end
