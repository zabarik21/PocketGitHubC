//
//  RepoCountView.h
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#ifndef RepoCountView_h
#define RepoCountView_h


#endif /* RepoCountView_h */


typedef NS_ENUM(NSInteger, RepoCountType){
  views,
  forks
};

@interface RepoCountView : UIView
-(id)initWithType:(RepoCountType)type;
@property (nonatomic) NSInteger count;
@end
