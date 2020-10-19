//
//  RssFeed.m
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import "RssFeed.h"

@implementation RssFeed

- (instancetype)initWithDictinary:(NSDictionary *)dict {
    self = [super init];
    if (!self) return nil;

    _version = [dict valueForKey:@"version"];
    _userComment = [dict valueForKey:@"user_comment"];
    _homePageURL = [dict valueForKey:@"home_page_url"];
    _feedURL = [dict valueForKey:@"feed_url"];
    _title = [dict valueForKey:@"title"];
    _feedDescription = [dict valueForKey:@"description"];
    NSArray<NSDictionary *>* cardsArray = [dict valueForKey:@"items"];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [cardsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:[[CardInfo alloc] initWithDictinary:cardsArray[idx]]];
    }];
    _cards = array;
    return self;
}

@end
