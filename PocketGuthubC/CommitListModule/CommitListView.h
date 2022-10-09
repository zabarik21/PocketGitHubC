//
//  CommitListView.h
//  PocketGuthubC
//
//  Created by Timofey on 9/10/2022.
//

#ifndef CommitListView_h
#define CommitListView_h


#endif /* CommitListView_h */
#import <UIKit/UIKit.h>
#import "CommitCellViewData.h"

//@interface CommitListConstants : NSObject
//extern NSString const *headerTitle;
//extern CGFloat const headerHeight;
//@end
//
//@implementation CommitListConstants
//NSString const *headerTitle = @"Commits";
//CGFloat const headerHeight = 100;
//@end


@interface CommitListView : UICollectionViewController
@property (strong, nonatomic) NSArray<CommitCellViewData *> *viewData;
@end
