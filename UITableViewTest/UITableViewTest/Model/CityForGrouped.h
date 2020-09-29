//
//  CityForGrouped.h
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CityForGrouped : NSObject

@property(nonatomic, strong)NSMutableArray *head;

@property(nonatomic, strong)NSMutableArray *first;
@property(nonatomic, strong)NSMutableArray *second;
@property(nonatomic, strong)NSMutableArray *third;

@property(nonatomic, strong)NSMutableArray *details;

+ (CityForGrouped *)sharedSingleton;

- (NSString *)detailByName:(NSString *)cityName;

@end

NS_ASSUME_NONNULL_END
