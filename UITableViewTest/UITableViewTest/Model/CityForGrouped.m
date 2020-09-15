//
//  CityForGrouped.m
//  UITableViewTest
//
//  Created by bytedance on 2020/9/10.
//  Copyright © 2020 bytedance. All rights reserved.
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

@end
