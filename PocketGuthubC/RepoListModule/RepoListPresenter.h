//
//  RepoListPresenter.h
//  PocketGuthubC
//
//  Created by Timofey on 8/10/2022.
//

#ifndef RepoListPresenter_h
#define RepoListPresenter_h


#endif /* RepoListPresenter_h */
#import "VIPER Protocols.h"

@interface RepoListPresenter : NSObject<RepoListInteractorOutput, RepoListViewOutput>
-(id)initWithView:(id<RepoListViewInput>)view;
@property (strong, nonatomic) id<RepoListInteractorInput> interactor;
@property (strong, nonatomic) id<RepoListRouterProtocol> router;
@end
