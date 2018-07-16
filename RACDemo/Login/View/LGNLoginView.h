//
//  LGNLoginView.h
//  RACDemo
//
//  Created by 49you on 2018/7/12.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "LGNBaseView.h"

@interface LGNLoginView : LGNBaseView

/** 底层滚动视图 */
@property (nonatomic, strong, readonly) UIScrollView *bgSV;
/** 占位图 */
@property (nonatomic, strong, readonly) UIView *holderView;
/** 用户名 */
@property (nonatomic, strong, readonly) UITextField *usernameTF;
/** 密码 */
@property (nonatomic, strong, readonly) UITextField *passwordTF;
/** 验证码 */
@property (nonatomic, strong, readonly) UITextField *verifycodeTF;
/** 倒计时 */
@property (nonatomic, strong, readonly) UIButton *countdownBtn;
/** 登录按钮 */
@property (nonatomic, strong, readonly) UIButton *loginBtn;
/** 注册按钮 */
@property (nonatomic, strong, readonly) UIButton *registerBtn;

@end
