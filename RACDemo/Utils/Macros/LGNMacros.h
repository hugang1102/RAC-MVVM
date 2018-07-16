//
//  LGNMacros.h
//  RACDemo
//
//  Created by 49you on 2018/7/13.
//  Copyright © 2018年 49you. All rights reserved.
//

#ifndef LGNMacros_h
#define LGNMacros_h

#define LGNRGBA(r,g,b,a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]
#define LGNRGB(r,g,b) LGNRGBA(r,g,b,1.0)
#define LGNRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define LGNRGBAHex(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#endif /* LGNMacros_h */
