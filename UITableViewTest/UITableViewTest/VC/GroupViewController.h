//
//  GroupViewController.h
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/8.
//

#import <UIKit/UIKit.h>
#import "SwitchViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface GroupViewController : UIViewController

@property(nonatomic, weak) id<SwitchViewProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
