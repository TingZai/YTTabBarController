//
//  YTTabBarButton.h
//  02-自定制TabBar
//
//  Created by 余婷 on 16/6/4.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTTabBarButton : UIView

//=========属性========
//是否选中
@property(nonatomic, assign) BOOL isSelected;
//item
@property(nonatomic, strong)UITabBarItem * item;

//选中颜色
@property(nonatomic, strong)UIColor * selectColor;
//正常颜色
@property(nonatomic, strong)UIColor *normalColor;

//添加事件
- (void)addTarget:(id)target action:(SEL)action;



@end
