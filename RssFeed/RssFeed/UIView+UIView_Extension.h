//
//  UIView+UIView_Extension.h
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (UIView_Extension)
-(void) addAutoLayoutSubView: (UIView *)view;
-(NSArray<NSLayoutConstraint *> *)autoPinEdgesToSuperviewEdges;
-(NSArray<NSLayoutConstraint *> *)autoPinEdgesToSuperviewEdgesWith:(UIEdgeInsets *)insets;
@end

NS_ASSUME_NONNULL_END
