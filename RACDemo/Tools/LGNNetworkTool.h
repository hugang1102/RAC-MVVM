//
//  LGNNetworkTool.h
//  RACDemo
//
//  Created by 49you on 2018/7/12.
//  Copyright © 2018年 49you. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(id response);
typedef void(^failureBlock)(NSError *error);

@interface LGNNetworkTool : NSObject

+ (void)loginWithParam:(id)param success:(successBlock)successBlock failure:(failureBlock)failureBlock;

@end
