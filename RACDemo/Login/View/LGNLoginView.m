//
//  LGNLoginView.m
//  RACDemo
//
//  Created by 49you on 2018/7/12.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "LGNLoginView.h"

@interface LGNLoginView ()

/** 底层滚动视图 */
@property (nonatomic, strong) UIScrollView *bgSV;
/** 占位图 */
@property (nonatomic, strong) UIView *holderView;
/** 用户名 */
@property (nonatomic, strong) UITextField *usernameTF;
/** 密码 */
@property (nonatomic, strong) UITextField *passwordTF;
/** 验证码 */
@property (nonatomic, strong) UITextField *verifycodeTF;
/** 倒计时 */
@property (nonatomic, strong) UIButton *countdownBtn;
/** 登录按钮 */
@property (nonatomic, strong) UIButton *loginBtn;
/** 注册按钮 */
@property (nonatomic, strong) UIButton *registerBtn;

@end

@implementation LGNLoginView

- (void)configUI
{
    // 子视图约束
    [self.bgSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(UIScreen.mainScreen.bounds.size.height);
    }];
    
    [self.holderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(0);;
        make.width.mas_equalTo(self.bgSV.mas_width);
        make.height.mas_equalTo(UIScreen.mainScreen.bounds.size.height);
    }];
    
    [self.usernameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(120.0f);
        make.left.mas_equalTo(20.0f);
        make.right.mas_equalTo(-20.0f);
        make.height.mas_equalTo(50.0f);
    }];
    
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.usernameTF.mas_bottom).mas_offset(10.0f);;
        make.left.equalTo(self.usernameTF);
        make.right.equalTo(self.usernameTF);
        make.height.equalTo(self.usernameTF);
    }];
    
    [self.verifycodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordTF.mas_bottom).mas_offset(10.0f);;
        make.left.equalTo(self.usernameTF);
        make.right.equalTo(self.countdownBtn.mas_left).offset(-10.0f);
        make.height.equalTo(self.usernameTF);
    }];
    
    [self.countdownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.verifycodeTF);
        make.right.equalTo(self.usernameTF);
        make.height.equalTo(self.usernameTF);
        make.width.equalTo(self.countdownBtn.mas_height).multipliedBy(1.5f);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.verifycodeTF.mas_bottom).mas_offset(50.0f);
        make.left.equalTo(self.usernameTF);
        make.right.equalTo(self.usernameTF);
        make.height.equalTo(self.usernameTF);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).mas_offset(10.0f);
        make.left.equalTo(self.usernameTF);
        make.right.equalTo(self.usernameTF);
        make.height.equalTo(self.usernameTF);
    }];
}

#pragma mark - setter & getter

- (UIScrollView *)bgSV
{
    if (_bgSV == nil) {
        _bgSV = [[UIScrollView alloc] init];
        _bgSV.backgroundColor = [UIColor greenColor];
        _bgSV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _bgSV.bounces = NO;
        [self.superViw addSubview:_bgSV];
    }
    return _bgSV;
}

- (UIView *)holderView
{
    if (_holderView == nil) {
        _holderView = [[UIView alloc] init];
        _holderView.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        [self.bgSV addSubview:_holderView];
    }
    return _holderView;
}

- (UITextField *)usernameTF
{
    if (_usernameTF == nil) {
        _usernameTF = [[UITextField alloc] init];
        _usernameTF.placeholder = @"用户名";
        _usernameTF.borderStyle = UITextBorderStyleRoundedRect;
        _usernameTF.layer.borderColor = [[UIColor clearColor] CGColor];
        _usernameTF.layer.borderWidth = 1.5f;
        _usernameTF.layer.cornerRadius = 3.0f;
        [self.holderView addSubview:_usernameTF];
    }
    return _usernameTF;
}

- (UITextField *)passwordTF
{
    if (_passwordTF == nil) {
        _passwordTF = [[UITextField alloc] init];
        _passwordTF.placeholder = @"密码";
        _passwordTF.borderStyle = UITextBorderStyleRoundedRect;
        _passwordTF.layer.borderColor = [[UIColor clearColor] CGColor];
        _passwordTF.layer.borderWidth = 1.5f;
        _passwordTF.layer.cornerRadius = 3.0f;
        [self.holderView addSubview:_passwordTF];
    }
    return _passwordTF;
}

- (UITextField *)verifycodeTF
{
    if (_verifycodeTF == nil) {
        _verifycodeTF = [[UITextField alloc] init];
        _verifycodeTF.placeholder = @"验证码";
        _verifycodeTF.borderStyle = UITextBorderStyleRoundedRect;
        _verifycodeTF.layer.borderColor = [[UIColor clearColor] CGColor];
        _verifycodeTF.layer.borderWidth = 1.5f;
        _verifycodeTF.layer.cornerRadius = 3.0f;
        _verifycodeTF.keyboardType = UIKeyboardTypeNumberPad;
        [self.holderView addSubview:_verifycodeTF];
    }
    return _verifycodeTF;
}

- (UIButton *)countdownBtn
{
    if (_countdownBtn == nil) {
        _countdownBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _countdownBtn.backgroundColor = [UIColor brownColor];
        _countdownBtn.layer.cornerRadius = 3.0f;
        [_countdownBtn setTitle:@"验证码" forState:UIControlStateNormal];
        [_countdownBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _countdownBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [self.holderView addSubview:_countdownBtn];
    }
    return _countdownBtn;
}

- (UIButton *)loginBtn
{
    if (_loginBtn == nil) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        UIColor *loginBtnBgColor = [UIColor orangeColor];
        // 默认状态
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn setBackgroundImage:[UIImage imageWithColor:loginBtnBgColor size:CGSizeMake(100, 100)] forState:UIControlStateNormal];
        
        // 不可用状态
        UIColor *loginBtnBgDisabledColor = [loginBtnBgColor colorWithAlphaComponent:0.5];
        [_loginBtn setBackgroundImage:[UIImage imageWithColor:loginBtnBgDisabledColor size:CGSizeMake(100, 100)] forState:UIControlStateDisabled];
        
        _loginBtn.layer.cornerRadius = 3.0f;
        _loginBtn.layer.masksToBounds = YES;
        [self.holderView addSubview:_loginBtn];
    }
    return _loginBtn;
}

- (UIButton *)registerBtn
{
    if (_registerBtn == nil) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _registerBtn.backgroundColor = [UIColor purpleColor];
        _registerBtn.layer.cornerRadius = 3.0f;
        [self.holderView addSubview:_registerBtn];
    }
    return _registerBtn;
}

@end
