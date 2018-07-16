//
//  LGNLoginViewModel.h
//  RACDemo
//
//  Created by 49you on 2018/7/12.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "LGNBaseViewModel.h"

@class LGNLoginModel;

@interface LGNLoginViewModel : LGNBaseViewModel

/** 组合命令 */
@property (nonatomic, strong, readonly) RACCommand *loginCommand;
/** 请求结果 */
@property (nonatomic, strong, readonly) LGNLoginModel *loginModel;

@end
