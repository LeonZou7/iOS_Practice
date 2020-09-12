//
//  AppDelegate.m
//  UITableViewTest
//
//  Created by bytedance on 2020/9/2.
//  Copyright © 2020 bytedance. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /*  launchOptions存储程序启动的原因，分情况有：
     用户直接启动：无数据
     由其他程序通过openURL启动：UIApplicationLaunchOptionsURLKey中存储启动URL（NSURL）， UIApplicationLaunchOptionsSourceApplicationKey存储启用源程序的bundleID（NSString）
     由远程通知启动：UIApplicationLaunchOptionsRemoteNotificationKey存储远程通知信息userInfo （NSDictionary）
     其他的key还包括：UIApplicationLaunchOptionsAnnotationKey,UIApplicationLaunchOptionsLocationKey, UIApplicationLaunchOptionsNewsstandDownloadsKey
     */
    self.cities = [NSMutableArray arrayWithObjects:@"Beijing", @"London", @"Paris", @"New York", @"Tokyo", @"Victoria", @"Vietnam", @"Hawaii", @"Amazon", nil];
    self.details = [NSMutableArray arrayWithObjects:@"aaa", @"bbb", @"ccc", @"ddd", @"eee", @"fff", @"ggg", @"hhh", @"iii", nil];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    ViewController* viewController = [[ViewController alloc] init];
    self.window.rootViewController = viewController;
    
    [self.window makeKeyAndVisible];    //让window成为主窗口并显示
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
