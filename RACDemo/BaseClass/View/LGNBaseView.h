//
//  LGNBaseView.h
//  RACDemo
//
//  Created by 49you on 2018/7/12.
//  Copyright © 2018年 49you. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGNBaseView : NSObject

/** 父视图 */
@property (nonatomic, strong) UIView *superViw;

- (instancetype)initWithSuperView:(UIView *)superViw;

/** 配置UI，子类实现 */
- (void)configUI;

@end
