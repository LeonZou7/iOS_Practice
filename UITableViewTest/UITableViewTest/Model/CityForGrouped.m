//
//  CityForGrouped.m
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/10.
//  Copyright © 2020 Leon Zou. All rights reserved.
//

#import "CityForGrouped.h"

@implementation CityForGrouped

- (instancetype)init {
    if (self = [super init]) {
        self.head = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", nil];
        
        self.first = [NSMutableArray arrayWithObjects:@"aaa", @"bbb", @"ccc", nil];
        self.second = [NSMutableArray arrayWithObjects:@"111", @"222", @"333", nil];
        self.third = [NSMutableArray arrayWithObjects:@"!!!", @"@@@", @"###", nil];
        
        self.details = [NSMutableArray arrayWithObjects:@"first", @"second", @"third", nil];
    }
    return self;
}

- (NSString *)detailByName:(NSString *)cityName {
    if ([self.first containsObject:cityName]) {
        return [self.details objectAtIndex:[self.first indexOfObject:cityName]];
    } else if ([self.second containsObject:cityName]) {
        return [self.details objectAtIndex:[self.second indexOfObject:cityName]];
    } else if ([self.third containsObject:cityName]) {
        return [self.details objectAtIndex:[self.third indexOfObject:cityName]];
    }
    return @"";
}

@end
