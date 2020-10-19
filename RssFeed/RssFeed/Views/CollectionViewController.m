//
//  CollectionViewController.m
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import "CollectionViewController.h"
#import "RssFeed-Swift.h"
#import "CollectionViewDelegateFlowLayout.h"
#import "CollectionViewCell.h"
#import "WebViewController.h"

@interface CollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong, readonly) RssFeedViewModel *viewModel;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) ImageHelper *imageHelper;
@property (nullable, nonatomic, weak) UIActivityIndicatorView *activityIndicator;
@end

@implementation CollectionViewController

#pragma mark - Lifecycle

- (instancetype)initWithViewModel:(RssFeedViewModel *)viewModel imageHelper: (ImageHelper *) helper {
    self = [super init];
    if (!self) return nil;
    _viewModel = viewModel;
    _imageHelper = helper;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = _viewModel.title;
    // Set collection view
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addAutoLayoutSubview:collectionView];
     [self.collectionView constrainToSuperviewEdges:ViewEdgeTop | ViewEdgeLeadingAndTrailing withInsets:UIEdgeInsetsZero relativeToMargins:NO];
    self.collectionView = collectionView;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:[CollectionViewCell reuseId]];

    // Add activity Indicator
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.hidesWhenStopped = YES;
    activityIndicator.color = [UIColor redColor];
    [self.view addAutoLayoutSubview:activityIndicator];
    [activityIndicator autoCenterInSuperview];
    [activityIndicator.heightAnchor constraintEqualToConstant:50.0f].active = YES;
    [activityIndicator.widthAnchor constraintEqualToConstant:50.0f].active = YES;
    self.activityIndicator = activityIndicator;

    // Add right bar button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
    [self refresh];
}

-(void) refresh {
    [self.activityIndicator startAnimating];
    __weak __typeof__(self) weakSelf = self;
       [_viewModel fetchRssFeeds:^{
            __typeof__(self) strongSelf = weakSelf;
            dispatch_async(dispatch_get_main_queue(), ^{
                strongSelf.title = strongSelf.viewModel.title;
                [strongSelf.activityIndicator stopAnimating];
                [strongSelf.collectionView reloadData];
           });
       } error:^(NSError * _Nonnull error) {
           // Handle error
       }];
}

-(void) viewWillAppear: (BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _viewModel.numberOfsections;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_viewModel numberOfItemsInSection: section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CollectionViewCell reuseId] forIndexPath:indexPath];
    CardInfo *data = [_viewModel cardDataAtRow: indexPath.row];
    if (data) {
        [cell setCardData:data imageHelper:_imageHelper];
    }
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CardInfo *data = [_viewModel cardDataAtRow: indexPath.row];
    if (data) {
        [self.navigationController pushViewController:[[WebViewController alloc] initWithHTMLString:data.contentHtml title: data.title] animated:true];
    }
}



#pragma mark - CollectionViewFlowLayout Methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath row] == 0) {
        return CGSizeMake(collectionView.bounds.size.width , _viewModel.isIPad ? 220 : 200);
    } else {
        int numberOfTileColumns = _viewModel.isIPad ? 3 : 2;
        int itemHeight = _viewModel.isIPad ? 170 : 150;
        UICollectionViewFlowLayout* layout = (UICollectionViewFlowLayout *)collectionViewLayout;
        int minimumInteritemSpacing = layout.minimumLineSpacing * numberOfTileColumns;
        CGFloat spaceAvailableForCells = collectionView.frame.size.width - layout.sectionInset.left - layout.sectionInset.right - minimumInteritemSpacing;
        CGFloat itemWidth = floor(spaceAvailableForCells / numberOfTileColumns);
        return CGSizeMake(itemWidth, itemHeight);
    }
}

@end
