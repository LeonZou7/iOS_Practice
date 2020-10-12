//
//  ZRandomDataGenerator.m
//  UITableViewTest
//
//  Created by LeonZou on 2020/10/12.
//

#import "ZRandomDataGenerator.h"

@implementation ZRandomDataGenerator

+ (NSString *)randomString {
    int count = arc4random() % 7;
    NSArray *alphabet = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g"];
    NSMutableString *res = nil;
    
    for (int i=0; i<count; i++) {
        [res stringByAppendingString:alphabet[i]];
    }
    
    return [[NSString alloc] stringByAppendingString:res];
}

+ (NSInteger)randomInteger {
    return arc4random() % 99;
}

+ (float)randomFloat {
    return (float)(arc4random() % 100) / 100;
}

@end
