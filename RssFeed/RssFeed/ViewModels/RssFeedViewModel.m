//
//  RssFeedViewModel.m
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import "RssFeedViewModel.h"
#import "RssFeed.h"
#import "Constants.h"

@interface RssFeedViewModel()
@property RssFeed *feedData;
@property (nonatomic, copy) NSURL *url;

@end

@implementation RssFeedViewModel

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (!self) return nil;
    _url = url;
    return self;
}

-(NSInteger) numberOfsections {
    if (_feedData != nil && _feedData.cards != nil) {
        return 1;
    }
    return 0;
}

-(CardInfo *) cardDataAtRow: (NSInteger) row {
    if (_feedData != nil && _feedData.cards != nil) {
        return _feedData.cards[row];
    }
    return nil;
}

- (BOOL)isIPad {
    return IDIOM == IPAD;
}

-(NSString *) title {
    return _feedData.title;
}

- (NSInteger) numberOfItemsInSection:(NSInteger)section {
    if (_feedData != nil && _feedData.cards != nil) {
        return self.feedData.cards.count;
    }
    return 0;
}

- (void)fetchRssFeeds:(void (^)(void))success error:(void (^)(NSError * _Nonnull))apiError {
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:self.url];
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    NSURLSession *session = [NSURLSession sharedSession];
    __weak __typeof__(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      if(httpResponse.statusCode == 200)
      {
        __typeof__(self) strongSelf = weakSelf;
        NSError *parseError = nil;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
          strongSelf.feedData = [[RssFeed alloc] initWithDictinary:responseDictionary];
          success();
      }
      else
      {
          apiError(error);
      }
    }];
    [dataTask resume];

}
@end
