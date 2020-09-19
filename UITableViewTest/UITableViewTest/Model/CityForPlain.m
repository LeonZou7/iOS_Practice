//
//  CityForPlain.m
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/10.
//  Copyright © 2020 Leon Zou. All rights reserved.
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

- (NSString *)detailByName:(NSString *)cityName {
    if ([self.cities containsObject:cityName]) {
        return [self.details objectAtIndex:[self.cities indexOfObject:cityName]];
    }
    return @"";
}

@end
