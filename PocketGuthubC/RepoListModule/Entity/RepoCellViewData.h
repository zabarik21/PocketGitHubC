//
//  RepoCellViewData.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef RepoCellViewData_h
#define RepoCellViewData_h


#endif /* RepoCellViewData_h */

#import "Repo.h"

@interface RepoCellViewData: NSObject
@property (nonatomic, strong) NSString *reponame;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *repoDescription;
@property (nonatomic, strong) NSString *userImageString;
@property (nonatomic) NSInteger forksCount;
@property (nonatomic) NSInteger viewsCount;
-(id)initWith:(Repo *)repo;
@end


