//
//  RssFeedViewModel.h
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RssFeedViewModelProtocol.h"
#import "CardInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface RssFeedViewModel : NSObject

-(void) fetchRssFeeds:(void (^)(void)) success error:(void (^)(NSError *error))apiError;

-(NSInteger) numberOfItemsInSection: (NSInteger) section;
-(NSInteger) numberOfsections;
-(CardInfo*) cardDataAtRow: (NSInteger) row;
-(NSString *) title;
-(BOOL) isIPad;

- (instancetype)initWithURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
