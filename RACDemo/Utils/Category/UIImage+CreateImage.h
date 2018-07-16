//
//  UIImage+CreateImage.h
//  RACDemo
//
//  Created by 49you on 2018/7/12.
//  Copyright © 2018年 49you. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CreateImage)


/**
 通过颜色生成纯色图片

 @param color 颜色
 @param size 大小
 @return 生成的纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
