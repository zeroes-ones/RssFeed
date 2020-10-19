//
//  RssFeed.h
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface RssFeed : NSObject

@property (nullable, nonatomic, copy, readonly) NSString *version;
@property (nullable, nonatomic, copy, readonly) NSString *userComment;
@property (nullable, nonatomic, copy, readonly) NSString *homePageURL;
@property (nullable, nonatomic, copy, readonly) NSString *feedURL;
@property (nullable, nonatomic, copy, readonly) NSString *title;
@property (nullable, nonatomic, copy, readonly) NSString *feedDescription;
@property (nullable, nonatomic, copy, readonly) NSArray<CardInfo *> *cards;

- (instancetype)initWithDictinary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
