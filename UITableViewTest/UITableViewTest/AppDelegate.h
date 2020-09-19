//
//  AppDelegate.h
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/2.
//  Copyright © 2020 Leon Zou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityForPlain.h"
#import "CityForGrouped.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(nonatomic, strong) UIWindow* window;

@property(nonatomic, strong)CityForPlain *objectForPlain;
@property(nonatomic, strong)CityForGrouped *objectForGrouped;

@end

