//
//  AppDelegate.h
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/2.
//

#import <UIKit/UIKit.h>
#import "VC/SwitchViewProtocol.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, SwitchViewProtocol>

@property(nonatomic, strong) UIWindow* window;

- (UIViewController *)prepareMainView;

@end

