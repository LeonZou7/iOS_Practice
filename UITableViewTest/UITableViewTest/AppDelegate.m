//
//  AppDelegate.m
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/2.
//

#import "AppDelegate.h"
#import "PlainViewController.h"
#import "GroupViewController.h"
#import "ScrollViewController.h"
#import "LoginViewController.h"
#import "CameraViewController.h"

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
        
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    self.window.rootViewController = loginVC;
    
    [self.window makeKeyAndVisible];    //让window成为主窗口并显示

    return YES;
}

- (UIViewController *)displayMainViewAfterLogin {
    // mainView
    PlainViewController *plainVC = [[PlainViewController alloc] init];
    GroupViewController *groupedVC = [[GroupViewController alloc] init];
    ScrollViewController *scrollVC = [[ScrollViewController alloc] init];

    // TODO: create a scrollView which contains 2 tableView (plain and grouped)
    CameraViewController *cameraVC = [[CameraViewController alloc] init];   // navigationController's default view
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:cameraVC];
    navigationController.tabBarItem.title = @"Home";

    UITabBarController *tabBarController = [[UITabBarController alloc] init];

    [tabBarController setViewControllers:@[navigationController, plainVC, groupedVC, scrollVC]];

    self.window.rootViewController = tabBarController;
    
    return tabBarController;
}

@end
