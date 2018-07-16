//
//  LGNBaseView.m
//  RACDemo
//
//  Created by 49you on 2018/7/12.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "LGNBaseView.h"

@implementation LGNBaseView

- (instancetype)initWithSuperView:(UIView *)superViw
{
    self = [super init];
    if (self) {
        _superViw = superViw;
        [self configUI];
    }
    return self;
}

- (void)configUI {};

@end
