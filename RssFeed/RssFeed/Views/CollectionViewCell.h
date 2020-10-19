//
//  CollectionViewCell.h
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardInfo.h"
#import "ImageHelper.h"

@interface CollectionViewCell : UICollectionViewCell

/// Reuse identifier to use for PGImageViewCell
+ (nonnull NSString *)reuseId;
- (void) setCardData:(CardInfo *)cardData imageHelper: (ImageHelper *) helper;
@end

