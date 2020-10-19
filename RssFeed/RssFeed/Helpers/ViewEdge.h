//
//  EdgeView.h
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 Edges of a view. See `UIView.constrainToSuperview(edges:insets:relativeToMargins:)`
 for example uses.

 Not declared as a Swift option set type because then it would not be usable from Objective-C.
 */
typedef NS_OPTIONS(NSUInteger, ViewEdge) {
    ViewEdgeTop = 1 << 0,
    ViewEdgeLeading = 1 << 1,
    ViewEdgeBottom = 1 << 2,
    ViewEdgeTrailing = 1 << 3,
    ViewEdgeTopAndBottom = ViewEdgeTop | ViewEdgeBottom,
    ViewEdgeLeadingAndTrailing = ViewEdgeLeading | ViewEdgeTrailing,
    ViewEdgeAll = ViewEdgeTopAndBottom | ViewEdgeLeadingAndTrailing,
};
