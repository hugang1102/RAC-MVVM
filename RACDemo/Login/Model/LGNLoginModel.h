//
//  LGNLoginModel.h
//  RACDemo
//
//  Created by 49you on 2018/7/12.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "LGNBaseModel.h"

@interface LGNLoginModel : LGNBaseModel

/** 昵称 */
@property (nonatomic, copy) NSString *nickname;
/** 生日 */
@property (nonatomic, copy) NSString *birthday;
/** 性别 0：女 1：男 */
@property (nonatomic, assign) BOOL sex;

@end
