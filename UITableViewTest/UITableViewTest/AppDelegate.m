//
//  AppDelegate.m
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/2.
//  Copyright © 2020 Leon Zou. All rights reserved.
//

#import "AppDelegate.h"
#import "PlainViewController.h"
#import "GroupViewController.h"

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
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.objectForPlain = [[CityForPlain alloc] init];
    self.objectForGrouped = [[CityForGrouped alloc] init];
    
    PlainViewController *plainVC = [[PlainViewController alloc] init];
    plainVC.view.backgroundColor = [UIColor cyanColor];
    plainVC.tabBarItem.title = @"Plain";
    
    GroupViewController *groupedVC = [[GroupViewController alloc] init];
    groupedVC.view.backgroundColor = [UIColor purpleColor];
    groupedVC.tabBarItem.title = @"Grouped";
    
    // TODO: add a button and a imageView on the start view, button for camera and the imageView for pic
    // TODO: complete the navigationBar with more barItems
    ViewController *viewController = [[ViewController alloc] init];   // navigationController's default view
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navigationController.tabBarItem.title = @"Home";
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    [tabBarController setViewControllers:@[navigationController, plainVC, groupedVC]];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];    //让window成为主窗口并显示
    
    return YES;
}

@end
