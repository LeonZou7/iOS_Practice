//
//  SwitchViewProtocol.h
//  UITableViewTest
//
//  Created by LeonZou on 2020/9/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SwitchViewProtocol <NSObject>

@required
- (void)switchToRightViewFromIndex:(NSInteger)index;
- (void)switchToLeftViewFromIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
