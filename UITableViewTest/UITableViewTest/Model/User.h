//
//  User.h
//  UITableViewTest
//
//  Created by Leon Zou on 2020/9/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property(nonatomic, copy)NSString *username;
@property(nonatomic, copy)NSString *password;

+ (User *)sharedSingleton;

- (void)changeUsernameWith:(NSString *)name;
- (void)changePasswordWith:(NSString *)passw;

@end

NS_ASSUME_NONNULL_END
