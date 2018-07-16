//
//  NSString+Check.h
//  RACDemo
//
//  Created by 49you on 2018/7/10.
//  Copyright © 2018年 49you. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Check)

/**
 验证用户名是否符合规则

 @return 验证结果
 */
- (BOOL)verifyUsernameText;

/**
 验证密码是否符合规则
 
 @return 验证结果
 */
- (BOOL)verifyPasswordText;

@end
