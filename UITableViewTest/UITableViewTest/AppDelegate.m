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

@property(nonatomic, strong)UINavigationController *navigationController;
@property(nonatomic, strong)UITabBarController *tabBarController;

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
    
    // login page
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    self.window.rootViewController = loginVC;
    
    [self.window makeKeyAndVisible];    //让window成为主窗口并显示

    return YES;
}

#pragma mark - View Methods

- (UIViewController *)prepareMainView {
    // mainView
    CameraViewController *cameraVC = [[CameraViewController alloc] init];
    PlainViewController *plainVC = [[PlainViewController alloc] init];
    GroupViewController *groupedVC = [[GroupViewController alloc] init];
    ScrollViewController *scrollVC = [[ScrollViewController alloc] init];

    _navigationController = [[UINavigationController alloc] initWithRootViewController:cameraVC];   // cameraVC is navigationController's default view
    _navigationController.tabBarItem.title = @"Home";

    _tabBarController = [[UITabBarController alloc] init];
    [_tabBarController setViewControllers:@[_navigationController, plainVC, groupedVC, scrollVC]];
    self.window.rootViewController = _tabBarController;
    
    return _tabBarController;
}

#pragma mark - Switch Methods

- (void)switchToLeftViewFromIndex:(NSInteger)index {
    if (index < [self.tabBarController.viewControllers count] - 1) {
        [self.tabBarController setSelectedIndex:index + 1];
        NSLog(@"from Appdelegate: View %ld switches to View %ld", index, index + 1);
    } else {
        [self.tabBarController setSelectedIndex:0];
        NSLog(@"from Appdelegate: back to View 0");
    }
}

- (void)switchToRightViewFromIndex:(NSInteger)index {
    if (index > 0) {
        [self.tabBarController setSelectedIndex:index - 1];
        NSLog(@"from Appdelegate: View %ld switches to View %ld", index, index - 1);
    } else {
        [self.tabBarController setSelectedIndex:[self.tabBarController.viewControllers count] - 1];
        NSLog(@"from Appdelegate: back to end View");
    }
}

@end
