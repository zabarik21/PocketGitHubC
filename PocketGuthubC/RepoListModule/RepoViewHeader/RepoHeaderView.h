//
//  RepoHeaderView.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef RepoHeaderView_h
#define RepoHeaderView_h


#endif /* RepoHeaderView_h */

#import <UIKit/UIKit.h>
#import "RepoHeaderView.h"
#import "ReuseIdProtocol.h"

@interface RepoHeaderView : UICollectionReusableView<ReuseIdProtocol>
+(NSString *)reuseId;
-(instancetype)init;
-(void)setTitle:(NSString *)title;
@end
