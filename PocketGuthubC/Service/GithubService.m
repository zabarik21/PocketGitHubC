//
//  GithubService.m
//  PocketGuthubC
//
//  Created by Timofey on 7/10/2022.
//

#import <Foundation/Foundation.h>
#import "GithubService.h"
#import <AFHTTPSessionManager.h>
#import "StorageService.h"
#import "AuthConstants.h"

@interface GithubAPIConstants : NSObject
extern NSString *baseGithubURL;
extern NSString *reposPath;
extern NSString *commitsAPIfirstPath;
extern NSString *commitsAPIsecondPath;
extern NSString *bearerHeader;
@end

@implementation GithubAPIConstants
NSString *baseGithubURL = @"https://api.github.com";
NSString *reposPath = @"/user/repos";
NSString *commitsAPIfirstPath = @"/repos/";// + username/reponame
NSString *commitsAPIsecondPath = @"/commits";
NSString *bearerHeader = @"Bearer";
@end

@interface GithubService ()
@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) AFHTTPSessionManager *manager;
-(void)handleReposResponce
  :(id  _Nullable)reposArray
  :(void (^)(NSArray<Repo *> * _Nullable))success;

-(void)handleCommitsResponce
  :(id  _Nullable)comitsArray
  :(void (^)(NSArray<CommitResponce *> * _Nullable))onSuccess;

-(id)init;
@end


@implementation GithubService

+ (instancetype)shared {
  static GithubService *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[GithubService alloc] init];
  });
  return sharedInstance;
}

- (id)init {
  if (self = [super init]) {
    _token = [StorageService.shared getToken];
    _manager = [AFHTTPSessionManager manager];
  }
  return self;
}

- (void)fetchRepos
:(void (^)(NSArray<Repo *> * _Nullable))success
onFailure:(void (^)(NSError * _Nonnull))failure {
  NSDictionary<NSString*, NSString*> *headers = @{
    @"Accept": @"*/*",
    @"Authorization": [@"Bearer " stringByAppendingString:_token]
  };
  
  NSString *url = [baseGithubURL stringByAppendingString:reposPath];
  
  [_manager
   GET: url
   parameters:nil
   headers:headers
   progress:^(NSProgress * _Nonnull downloadProgress) {
    
  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    [self handleReposResponce:responseObject :success];
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull failedError) {
    failure(failedError);
  }];
}

- (void)fetchCommitsFor
:(Repo *)repo
:(void (^)(NSArray<CommitResponce *> * _Nullable))onSuccess
:(void (^)(NSError * _Nullable))onFailure {
  
  NSString *urlPath = [[commitsAPIfirstPath
                        stringByAppendingString:[
                          [repo.owner.login stringByAppendingString:@"/"] stringByAppendingString:repo.name]
   ] stringByAppendingString:commitsAPIsecondPath
  ];
  
  NSString *url = [baseGithubURL stringByAppendingString:urlPath];
  
  NSDictionary<NSString*, NSString*> *headers = @{
    @"Accept": @"*/*",
    @"Authorization": [@"Bearer " stringByAppendingString:_token]
  };
  
  [_manager
   GET: url
   parameters:nil
   headers:headers
   progress:^(NSProgress * _Nonnull downloadProgress) {
    
  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    [self handleCommitsResponce:responseObject :onSuccess];
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    onFailure(error);
  }];
}

- (void)handleReposResponce:(id)reposArray :(void (^)(NSArray<Repo *> * _Nullable))success {
  NSArray<NSDictionary *> *responseArray = reposArray;
  NSMutableArray<Repo *> *repos = [[NSMutableArray alloc] init];
  for (NSDictionary *dict in responseArray) {
    [repos addObject:[[Repo alloc] initFromDict:dict]];
  }
  success(repos);
}

- (void)handleCommitsResponce:(id)comitsArray :(void (^)(NSArray<CommitResponce *> * _Nullable))onSuccess {
  NSArray<NSDictionary *> *responseArray = comitsArray;
  NSMutableArray<Commit *> *commits = [[NSMutableArray alloc] init];;
  for (NSDictionary *commitDict in comitsArray) {
    [commits addObject:[[CommitResponce alloc] initFromDict:commitDict]];
  }
  onSuccess(commits);
}


@end
