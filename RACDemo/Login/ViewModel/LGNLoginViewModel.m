//
//  LGNLoginViewModel.m
//  RACDemo
//
//  Created by 49you on 2018/7/12.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "LGNLoginViewModel.h"
#import "LGNLoginModel.h"

@interface LGNLoginViewModel ()

/** 组合命令 */
@property (nonatomic, strong, readwrite) RACCommand *loginCommand;
/** 请求结果 */
@property (nonatomic, strong, readwrite) LGNLoginModel *loginModel;

@end

@implementation LGNLoginViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self requestDataInfo];
    }
    return self;
}

- (void)requestDataInfo
{
    [[self.loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        if ([x boolValue]) {
            NSLog(@"命令正在执行中");
        }else{
            NSLog(@"命令执行结束了");
        }
    }];
}

#pragma mark - setter & getter

- (RACCommand *)loginCommand
{
    if (_loginCommand == nil) {
        _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {

            RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                
                NSLog(@"发起请求");
                
                [LGNNetworkTool loginWithParam:input success:^(id response) {
                    [subscriber sendNext:response];
                    [subscriber sendCompleted];
                } failure:^(NSError *error) {
                    [subscriber sendError:error];
                    [subscriber sendCompleted];
                }];
                
                RACDisposable *disposable = [RACDisposable disposableWithBlock:^{
                    NSLog(@"信号释放了");
                }];
                return disposable;
            }];
            
            return [signal map:^id _Nullable(id  _Nullable value) {
                return [LGNLoginModel mj_objectWithKeyValues:value];
            }];
        }];
    }

    return _loginCommand;
}

@end
