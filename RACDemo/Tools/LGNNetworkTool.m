//
//  LGNNetworkTool.m
//  RACDemo
//
//  Created by 49you on 2018/7/12.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "LGNNetworkTool.h"

@implementation LGNNetworkTool

+ (void)loginWithParam:(id)param success:(successBlock)successBlock failure:(failureBlock)failureBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"请求的数据是:%@",param);
        NSLog(@"开始访问网络");
        sleep(3);
        if ([self getNowTimeTimestamp] % 2 == 0) {
            // 偶数
            NSLog(@"请求成功");
            NSDictionary *responseData = @{
                                           @"nickname" : @"老王",
                                           @"birthday" : @"19911102",
                                           @"sex" : @"1",
                                           };
            successBlock(responseData);
        } else {
            // 奇数
            NSLog(@"请求失败");
            NSError *error = [NSError errorWithDomain:NSCocoaErrorDomain code:110 userInfo:@{NSLocalizedFailureReasonErrorKey:@"时间不对啊"}];
            failureBlock(error);
        }
    });
}

+ (NSInteger)getNowTimeTimestamp{

    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a = [dat timeIntervalSince1970];
    return ((NSInteger)a);
    
}

@end
