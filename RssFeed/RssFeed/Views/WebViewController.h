//
//  WebViewController.h
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
- (instancetype)initWithHTMLString:(NSString *)htmlString title:(NSString *)title;
@end

