//
//  YTTabBarController.m
//  02-自定制TabBar
//
//  Created by 余婷 on 16/6/4.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "YTTabBarController.h"
#import "YTTabBar.h"
#import "YTTabBarButton.h"

//遵守协议
@interface YTTabBarController ()<YTTabBarDelegate>

@property(nonatomic, strong)YTTabBar * yt_tabBar;

@end

@implementation YTTabBarController


- (void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    
    //1.删除自动创建的tabBarbutton
    for (UIView * view in self.tabBar.subviews) {
        [view removeFromSuperview];
    }
    
    
    
    [self.tabBar addSubview:self.yt_tabBar];
    
    //2.设置选中下标
    self.yt_tabBar.selectedIndex = self.selectedIndex;
    
    self.yt_tabBar.backgroundImage = [UIImage imageNamed:@"tabBar"];
   
    
    
}
#pragma mark - 懒加载
- (YTTabBar *)yt_tabBar{

    if (_yt_tabBar == nil) {
        
        _yt_tabBar = [[YTTabBar alloc] init];
        _yt_tabBar.frame = self.tabBar.bounds;
        _yt_tabBar.backgroundColor = [UIColor whiteColor];
        //设置代理
        _yt_tabBar.delegate = self;
        
        
    }
    return _yt_tabBar;
}

#pragma mark - 添加子视图控制器
- (void)addController:(UIViewController *)controller WithTitle:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName{

    //设置tabBarItem
    controller.tabBarItem.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //将视图控制器添加标签栏控制器中
    [self addChildViewController:controller];
    
    
    
    //可以让自己定制的tabBar去创建一个对应的按钮
    [self.yt_tabBar addbuttonWithItem:controller.tabBarItem];
    
}

#pragma mark - YTTabBar Delegate
- (void)changeControllerWithIndex:(NSInteger)index{

    //切换视图控制器
    self.selectedIndex = index;
}

#pragma mark - 外部给centerView赋值
- (void)setCenterView:(UIView *)centerView{

    _centerView = centerView;
    
    self.yt_tabBar.centerView = centerView;
}





@end
