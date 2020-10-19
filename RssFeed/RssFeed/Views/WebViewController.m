//
//  WebViewController.m
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>
#import "RssFeed-Swift.h"

@interface WebViewController()

@property (nonatomic) WKWebView *webView;
@property (nullable, nonatomic, copy) NSString *navTitle;
@property (nullable, nonatomic, copy) NSString *htmlString;
@end

@implementation WebViewController

- (instancetype)initWithHTMLString:(NSString *)htmlString title:(NSString *)title {
    self = [super init];
    if (!self) return nil;
    self.htmlString = htmlString;
    self.navTitle = title;
    return self;
}

-(void) viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc] init];
    [self.view addAutoLayoutSubview:self.webView];
    self.title = self.navTitle;
    [self.webView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    [self.webView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
    [self.webView loadHTMLString:self.htmlString baseURL:nil];

}

@end
