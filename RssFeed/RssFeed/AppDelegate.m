//
//  AppDelegate.m
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

#import "AppDelegate.h"
#import "CollectionViewController.h"
#import "Constants.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    CollectionViewController *vc = [[CollectionViewController alloc] initWithViewModel:[[RssFeedViewModel alloc] initWithURL:[NSURL URLWithString:RSSFEED_URL]] imageHelper:[ImageHelper shared]];
    
     // Wrap it in navigation controller before setting it as root view
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    [[vc view] setBackgroundColor:[UIColor whiteColor]];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}


//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
