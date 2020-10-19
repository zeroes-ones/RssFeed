//
//  CardInfo.h
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardInfo : NSObject

@property (nullable, nonatomic, copy, readonly) NSString *cardId;
@property (nullable, nonatomic, copy, readonly) NSString *url;
@property (nullable, nonatomic, copy, readonly) NSString *category;
@property (nullable, nonatomic, copy, readonly) NSString *title;
@property (nullable, nonatomic, copy, readonly) NSString *encodedTitle;
@property (nullable, nonatomic, copy, readonly) NSString *featuredImage;
@property (nullable, nonatomic, copy, readonly) NSString *summary;
@property (nullable, nonatomic, copy, readonly) NSString *insightSummary;
@property (nullable, nonatomic, copy, readonly) NSString *content;
@property (nullable, nonatomic, copy, readonly) NSString *summaryHtml;
@property (nullable, nonatomic, copy, readonly) NSString *contentHtml;
@property (nullable, nonatomic, copy, readonly) NSString *datePublished;
@property (nullable, nonatomic, copy, readonly) NSString *dateModified;
@property (nullable, nonatomic, copy, readonly) NSString *author;

- (instancetype)initWithDictinary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
