//
//  CollectionViewCell.m
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import "CollectionViewCell.h"
#import "RssFeed-Swift.h"
#import "ImageHelper.h"

@interface CollectionViewCell()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UIActivityIndicatorView *activityIndicator;

@end

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;


    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.clipsToBounds = YES;
    [self.contentView addAutoLayoutSubview:imageView];
    [imageView.heightAnchor constraintEqualToAnchor:self.contentView.heightAnchor constant:-30.0f].active = YES;
    [imageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:3.0f].active = YES;
    [imageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-3.0f].active = YES;
    self.imageView = imageView;


    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:10];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.numberOfLines = 2;
    titleLabel.clipsToBounds = YES;
    titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    titleLabel.adjustsFontSizeToFitWidth = NO;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addAutoLayoutSubview:titleLabel];
    [titleLabel.leadingAnchor constraintEqualToAnchor:self.imageView.leadingAnchor constant:3.0f].active = YES;
    [titleLabel.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor].active = YES;
    [titleLabel.trailingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor].active = YES;
    self.titleLabel = titleLabel;

    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.hidesWhenStopped = YES;
    activityIndicator.color = [UIColor darkGrayColor];
    [self.contentView addAutoLayoutSubview:activityIndicator];
    [activityIndicator autoCenterInSuperview];
    [activityIndicator.heightAnchor constraintEqualToConstant:50.0f].active = YES;
    [activityIndicator.widthAnchor constraintEqualToConstant:50.0f].active = YES;
    [activityIndicator startAnimating];
    self.activityIndicator = activityIndicator;

    self.contentView.clipsToBounds = NO;
    self.contentView.layer.masksToBounds = NO;

    return self;
}

- (void)setCardData:(CardInfo *)cardData imageHelper: (ImageHelper *) helper {
    if (cardData) {
        [_titleLabel setText:cardData.title];

        NSURL *url = [NSURL URLWithString:cardData.featuredImage];
        if (url) {
            __weak __typeof__(self) weakSelf = self;
            [helper downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage * _Nonnull image) {
                __typeof__(self) strongSelf = weakSelf;
                if (succeeded) {
                    [strongSelf.activityIndicator stopAnimating];
                    strongSelf.imageView.image = image;
                }
            }];
        }
    }
}

#pragma mark - Public

+ (NSString *)reuseId {
    return @"ImageViewCell";
}

@end
