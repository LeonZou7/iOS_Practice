//
//  CityForPlain.h
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/10.
//  Copyright © 2020 Leon Zou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CityForPlain : NSObject

@property(nonatomic, strong)NSMutableArray *cities;
@property(nonatomic, strong)NSMutableArray *details;

- (NSString *)detailByName:(NSString *)cityName;

@end

NS_ASSUME_NONNULL_END
