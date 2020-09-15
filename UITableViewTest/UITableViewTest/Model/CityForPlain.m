//
//  CityForPlain.m
//  UITableViewTest
//
//  Created by bytedance on 2020/9/10.
//  Copyright © 2020 bytedance. All rights reserved.
//

#import "CityForPlain.h"

@implementation CityForPlain

- (instancetype)init {
    if (self = [super init]) {
        self.cities = [NSMutableArray arrayWithObjects:@"Beijing", @"London", @"Paris", @"New York", @"Tokyo", @"Victoria", @"Vietnam", @"Hawaii", @"Amazon", @"Brasilia", @"Havana", @"Cairo", @"Suva", @"New Delhi", @"Dublin", @"Rome", @"Male", @"Juba", nil];
        
        self.details = [NSMutableArray arrayWithObjects:@"aaa", @"bbb", @"ccc", @"ddd", @"eee", @"fff", @"ggg", @"hhh", @"iii", @"jjj", @"kkk", @"lll", @"mmm", @"nnn", @"ooo", @"ppp", @"qqq", @"rrr", nil];
    }
    return self;
}

@end
