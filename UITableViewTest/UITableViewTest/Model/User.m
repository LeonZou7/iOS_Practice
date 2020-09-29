//
//  User.m
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/16.
//

#import "User.h"

@interface User ()

@end

static User *sharedSingleton = nil;

@implementation User

+ (User *)sharedSingleton {    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedSingleton = [[User alloc] init];
    });
    
    return sharedSingleton;
}

- (instancetype)init {
    if (self = [super init]) {
        _username = @"admin";
        _password = @"123";
    }
    return self;
}

- (void)changeUsernameWith:(NSString *)name {
    [User sharedSingleton].username = name;
    NSLog(@"Username changed.");
}

- (void)changePasswordWith:(NSString *)passw {
    [User sharedSingleton].password = passw;
    NSLog(@"Password changed.");
}

@end
