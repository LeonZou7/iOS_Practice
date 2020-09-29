//
//  CityForPlain.m
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/10.
//

#import "CityForPlain.h"

static CityForPlain *sharedSingleton = nil;

@implementation CityForPlain

+ (CityForPlain *)sharedSingleton {    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedSingleton = [[CityForPlain alloc] init];
    });
    
    return sharedSingleton;
}

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
