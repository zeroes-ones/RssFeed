//
//  CardInfo.m
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import "CardInfo.h"

@implementation CardInfo

- (instancetype)initWithDictinary:(NSDictionary *)dict {
    self = [super init];
    if (!self) return nil;

    _cardId = [dict valueForKey:@"id"];
    _url = [dict valueForKey:@"url"];
    _category = [dict valueForKey:@"category"];
    _title = [dict valueForKey:@"title"];
    _encodedTitle = [dict valueForKey:@"encoded_title"];
    _featuredImage = [dict valueForKey:@"featured_image"];
    _summary = [dict valueForKey:@"summary"];
    _insightSummary = [dict valueForKey:@"insight_summary"];
    _content = [dict valueForKey:@"content"];
    _summaryHtml = [dict valueForKey:@"summary_html"];
    _contentHtml = [dict valueForKey:@"content_html"];
    _datePublished = [dict valueForKey:@"date_published"];
    _dateModified = [dict valueForKey:@"date_modified"];

    if ([[dict valueForKey:@"author"] isKindOfClass:[NSDictionary class]]) {
        NSDictionary* authorDict = [dict valueForKey:@"author"];
        _author = [authorDict valueForKey:@"name"];
    }

    return self;
}

@end
