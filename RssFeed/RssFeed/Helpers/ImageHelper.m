//
//  ImageHelper.m
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import "ImageHelper.h"
#import "RssFeed-Swift.h"

@interface ImageHelper()

@end

@implementation ImageHelper

+ (id) shared {
    static ImageHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        // assign values
    }
    return self;
}

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSData *data = [ImageCache objectForKeyWithKey:url.absoluteString];
    if (data) {
        UIImage *image = [[UIImage alloc] initWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(YES,image);
        });
        return;
    }
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
      if (!error )
      {
          [ImageCache setObjectWithData:data forKey:url.absoluteString];
          UIImage *image = [[UIImage alloc] initWithData:data];
          dispatch_async(dispatch_get_main_queue(), ^{
              completionBlock(YES,image);
          });
      } else{
         NSLog(@"Error in downloading image:%@",url);
         completionBlock(NO,nil);
      }
    }];
    [dataTask resume];
}

@end
