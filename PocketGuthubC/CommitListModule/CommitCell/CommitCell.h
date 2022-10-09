//
//  CommitCell.h
//  PocketGuthubC
//
//  Created by Timofey on 9/10/2022.
//

#ifndef CommitCell_h
#define CommitCell_h


#endif /* CommitCell_h */
#import <UIKit/UIKit.h>
#import "ReuseIdProtocol.h"
#import "CommitCellViewData.h"

@interface CommitCell : UICollectionViewCell<ReuseIdProtocol>

@property (strong, nonatomic) CommitCellViewData *viewData;
-(id)init;
@end
