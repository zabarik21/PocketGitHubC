//
//  RepoCellView.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef RepoCellView_h
#define RepoCellView_h


#endif /* RepoCellView_h */
#import <UIKit/UIKit.h>
#import "../Entity/RepoCellViewData.h"
#import "RepoCountView.h"
#import "ReuseIdProtocol.h"

@interface RepoCellView : UICollectionViewCell<ReuseIdProtocol>
@property (nonatomic, strong) RepoCellViewData* viewData;
-(id) init;
@end
