//
//  UIView+UIView_Extension.m
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import "UIView+UIView_Extension.h"

@implementation UIView (UIView_Extension)
- (void)addAutoLayoutSubView:(UIView *)view {
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:view];
}


@end
