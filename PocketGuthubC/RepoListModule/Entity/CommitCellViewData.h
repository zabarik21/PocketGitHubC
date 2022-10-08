//
//  CommitCellViewData.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef CommitCellViewData_h
#define CommitCellViewData_h


#endif /* CommitCellViewData_h */
#import "../../Model/CommitResponce.h"

@interface CommitCellViewData : NSObject
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *hash;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *username;
-(instancetype)initWith:(CommitResponce *)responce;
@end
