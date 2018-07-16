//
//  NSString+Check.m
//  RACDemo
//
//  Created by 49you on 2018/7/10.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "NSString+Check.h"

@implementation NSString (Check)

- (BOOL)verifyUsernameText
{
    NSString *regex = @"[a-zA-Z0-9]{6,16}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isValid = [predicate evaluateWithObject:self];
    return isValid;
}

- (BOOL)verifyPasswordText
{
    NSString *regex = @"[a-zA-Z0-9]{6,16}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isValid = [predicate evaluateWithObject:self];
    return isValid;
}

@end
