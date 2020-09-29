//
//  CityForPlain.h
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CityForPlain : NSObject

@property(nonatomic, strong)NSMutableArray *cities;
@property(nonatomic, strong)NSMutableArray *details;

+ (CityForPlain *)sharedSingleton;  // 单例

- (NSString *)detailByName:(NSString *)cityName;

@end

NS_ASSUME_NONNULL_END
