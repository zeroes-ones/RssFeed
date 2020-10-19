//
//  CollectionViewController.h
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RssFeedViewModel.h"
#import "ImageHelper.h"

@interface CollectionViewController : UIViewController
- (instancetype)initWithViewModel:(RssFeedViewModel *)viewModel imageHelper: (ImageHelper *) helper;

@end

