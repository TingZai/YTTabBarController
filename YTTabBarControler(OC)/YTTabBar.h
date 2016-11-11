//
//  YTTabBar.h
//  02-自定制TabBar
//
//  Created by 余婷 on 16/6/4.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import <UIKit/UIKit.h>

//指定协议
@protocol YTTabBarDelegate <NSObject>



//切换到指定下标的视图控制器
- (void)changeControllerWithIndex:(NSInteger)index;

@end

@interface YTTabBar : UIView

//当前选中的下标
@property(nonatomic, assign) NSInteger selectedIndex;

//添加一个item
- (void)addbuttonWithItem:(UITabBarItem *)item;

//需要一个代理
@property(nonatomic, weak)id<YTTabBarDelegate> delegate;

//显示在中间的视图
@property(nonatomic, strong)UIView * centerView;

//背景图片
@property(nonatomic,strong)UIImage * backgroundImage;

@end
