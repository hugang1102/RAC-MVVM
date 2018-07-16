//
//  LGNRootTabBarController.m
//  RACDemo
//
//  Created by 49you on 2018/7/13.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "LGNRootTabBarController.h"
#import "LGNHomeNavigationController.h"
#import "LGNProductNavigationController.h"
#import "LGNCategoryNavigationController.h"
#import "LGNMineNavigationController.h"

@interface LGNRootTabBarController ()

@end

@implementation LGNRootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    [self addChildViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configUI
{
    self.tabBar.tintColor = LGNRGBA(245, 90, 93, 0.97);
}

- (void)addChildViewController {
    LGNHomeNavigationController *home = [[LGNHomeNavigationController alloc] initWithRootViewControllerWithTitle:@"单糖"];
    [self addChildViewControllerWith:home image:@"TabBar_home_23x23_"];
    
    LGNProductNavigationController *product = [[LGNProductNavigationController alloc] initWithRootViewControllerWithTitle:@"产品"];
    [self addChildViewControllerWith:product image:@"TabBar_gift_23x23_"];
    
    LGNCategoryNavigationController *category = [[LGNCategoryNavigationController alloc] initWithRootViewControllerWithTitle:@"分类"];
    [self addChildViewControllerWith:category image:@"TabBar_category_23x23_"];
    
    LGNMineNavigationController *mine = [[LGNMineNavigationController alloc] initWithRootViewControllerWithTitle:@"我的"];
    [self addChildViewControllerWith:mine image:@"TabBar_me_boy_23x23_"];
    
}

- (void)addChildViewControllerWith:(UIViewController *)controller image:(NSString *)imageName {
    
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@selected",imageName]];
    [self addChildViewController:controller];
}

@end
