//
//  LGNBaseNavigationController.m
//  RACDemo
//
//  Created by 49you on 2018/7/12.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "LGNBaseNavigationController.h"

@interface LGNBaseNavigationController ()

@end

@implementation LGNBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = LGNGlobalThemeColor;
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20]};
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"checkUserType_backward_9x15_"] style:UIBarButtonItemStylePlain target:self action:@selector(navigationItemDidClickLeft)];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)navigationItemDidClickLeft {
    [self popViewControllerAnimated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithRootViewControllerWithTitle:(NSString *)title
{
    // 获取根控制器
    NSString *className = NSStringFromClass([self class]);
    NSRange start = [className rangeOfString:@"LGN"];
    NSRange end = [className rangeOfString:@"NavigationController"];
    NSRange get = NSMakeRange(start.location + start.length, end.location - start.length);
    NSString *rootVCID = [className substringWithRange:get];
    NSString *rootVCName = [NSString stringWithFormat:@"LGN%@ViewController",rootVCID];
    
    UIViewController *rootVC = [[NSClassFromString(rootVCName) alloc] init];
    rootVC.title = title;
    LGNBaseNavigationController *nav = [[LGNBaseNavigationController alloc] initWithRootViewController:rootVC];
    
    return nav;
}

@end
