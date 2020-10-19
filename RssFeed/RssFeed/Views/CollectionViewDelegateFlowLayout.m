//
//  CollectionViewDelegateFlowLayout.m
//  RssFeed
//
//  Created by S on 10/18/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import "CollectionViewDelegateFlowLayout.h"
#import <UIKit/UIKit.h>

@interface CollectionViewDelegateFlowLayout() <UICollectionViewDelegateFlowLayout>
@end

@implementation CollectionViewDelegateFlowLayout

#pragma mark - CollectionViewFlowLayout Methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath row] == 0) {
        return CGSizeMake(collectionView.bounds.size.width , 200);
    } else {
        return CGSizeMake(collectionView.bounds.size.width/2, 200);
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
}

@end
