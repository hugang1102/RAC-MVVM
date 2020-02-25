//
//  ViewController.m
//  RACDemo
//
//  Created by 49you on 2018/7/10.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "ViewController.h"
#import "LGNLoginViewModel.h"
#import "LGNLoginView.h"
#import "LGNLoginModel.h"

const NSInteger CountdownNumber = 5;

@interface ViewController ()
{
    id<RACSubscriber> _subscriber;
}

/** LGNLoginViewModel */
@property (nonatomic, strong) LGNLoginViewModel *loginVM;
/** LGNLoginView */
@property (nonatomic, strong) LGNLoginView *loginView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self addNotificationObserver];
    [self configRAC];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)addNotificationObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedKeyboardDidShowNotification:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedKeyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)receivedKeyboardDidShowNotification:(NSNotification *)noti
{
    NSDictionary *userInfo = noti.userInfo;
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = aValue.CGRectValue;
    
    [self.loginView.bgSV mas_updateConstraints:^(MASConstraintMaker *make) {
        CGFloat height = UIScreen.mainScreen.bounds.size.height - keyboardRect.size.height;
        make.height.mas_equalTo(height);
    }];
}

- (void)receivedKeyboardWillHideNotification:(NSNotification *)noti
{
    [self.loginView.bgSV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(UIScreen.mainScreen.bounds.size.height);
    }];
}

- (void)configRAC
{
    @weakify(self);
    
    // 键盘下落
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [[tap rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        @strongify(self);
        [self.loginView.holderView endEditing:YES];
    }];
    [self.loginView.holderView addGestureRecognizer:tap];
    
    // 倒计时
    [[self.loginView.countdownBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        __block NSInteger count = CountdownNumber;
        x.enabled = NO;
        x.alpha = 0.5f;
        [x setTitle:[NSString stringWithFormat:@"%ld秒",count] forState:UIControlStateNormal];
        [self.loginView.verifycodeTF becomeFirstResponder];
        
        // timer放到主线程循环
        NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];
        NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            count--;
            [self.loginView.countdownBtn setTitle:[NSString stringWithFormat:@"%ld秒",count] forState:UIControlStateNormal];
            if (count < 0) {
                x.enabled = YES;
                x.alpha = 1.0f;
                [x setTitle:@"验证码" forState:UIControlStateNormal];
                
                // timer置空
                [timer invalidate];
                timer = nil;
            }
        }];
        [mainRunLoop addTimer:timer forMode:NSRunLoopCommonModes];
    }];
    
    ///监听文本框输入状态，确定按钮是否可以点击
    RAC(self.loginView.loginBtn, enabled) = [RACSignal combineLatest:@[self.loginView.usernameTF.rac_textSignal,
                                                   self.loginView.passwordTF.rac_textSignal,
                                                   self.loginView.verifycodeTF.rac_textSignal]
                                          reduce:^id _Nullable(NSString *username, NSString * password, NSString *verifyCode){
                                              return @([username verifyUsernameText] && [password verifyPasswordText] && (verifyCode.length > 0));

    }];
    
    // 登录按钮
    [[self.loginView.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        [SVProgressHUD show];
        [self.view endEditing:YES];
        
        NSDictionary *dic = @{
                              @"username" : self.loginView.usernameTF.text,
                              @"password" : self.loginView.passwordTF.text,
                              };
        RACSignal *signal = [self.loginVM.loginCommand execute:dic];
        [signal subscribeNext:^(LGNLoginModel * x) {
            
            NSLog(@"登录成功：%@",[x mj_keyValues]);
            [SVProgressHUD dismiss];
        }];
        
        [signal subscribeError:^(NSError * _Nullable error) {
            [SVProgressHUD showErrorWithStatus:error.localizedFailureReason];
            [SVProgressHUD dismissWithDelay:3];
            
            NSLog(@"登录失败：%@",error.localizedFailureReason);
        }];
    }];
}

#pragma mark - getter

- (LGNLoginViewModel *)loginVM
{
    if (!_loginVM){
        _loginVM = [[LGNLoginViewModel alloc] init];
    }
    return _loginVM;
}

- (LGNLoginView *)loginView
{
    if (!_loginView){
        _loginView = [[LGNLoginView alloc] initWithSuperView:self.view];
    }
    return _loginView;
}



@end
