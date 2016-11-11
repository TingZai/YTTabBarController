//
//  YTTabBar.m
//  02-自定制TabBar
//
//  Created by 余婷 on 16/6/4.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "YTTabBar.h"
#import "YTTabBarButton.h"

#define Btn_tag 100
#define Center_tag 1000

@interface YTTabBar(){

    BOOL _haveBackgroundImage;
}



@end

@implementation YTTabBar

- (void)setBackgroundImage:(UIImage *)backgroundImage{

    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49)];
    imageView.image = backgroundImage;
    imageView.contentMode = UIViewContentModeBottom;
    [self addSubview:imageView];
    [self sendSubviewToBack:imageView];
    
    _haveBackgroundImage = YES;
    
}

#pragma mark - 创建每个控制器对应的按钮
- (void)addbuttonWithItem:(UITabBarItem *)item{

    //1.创建一个按钮,不需要设置frame
    YTTabBarButton * button = [[YTTabBarButton alloc] init];
    //2.设置item属性
    button.item = item;
    //3.显示在界面上
    [self addSubview:button];
    //4.添加事件
    [button addTarget:self action:@selector(buttonOnclicked:)];
}

#pragma mark - 按钮点击
- (void)buttonOnclicked:(YTTabBarButton *)button{
    
    //把其他按钮变成非选中状态
    //获取到原来选中的按钮
    YTTabBarButton * tButton = [self viewWithTag:self.selectedIndex + Btn_tag];
    tButton.isSelected = NO;
    tButton.userInteractionEnabled = YES;
    

    //把当前点击的按钮变成选中状态
    button.isSelected = YES;
    self.selectedIndex = button.tag - Btn_tag;
    button.userInteractionEnabled = NO;
    
    
    
}

#pragma mark  - 改变选中下标
- (void)setSelectedIndex:(NSInteger)selectedIndex{

    _selectedIndex = selectedIndex;
    //让tabBarController去切换视图控制器
    //YTTaBar想要切换视图控制器，但是它做不到，需要tabBarController去帮他做这件事。
    //1.确定三要素
    //协议:切换到指定的视图控制器
    //代理:tabBarController
    //委托:YTTaBar
    [self.delegate changeControllerWithIndex:self.selectedIndex];
    
}


#pragma mark - 设置每个按钮的frame
- (void)layoutSubviews{

    //计算每个按钮的frame
    [self setFrameWithCenter];
    
}

//当考虑有centerView的时候
- (void)setFrameWithCenter{

    //1.通用属性
    CGFloat W = self.frame.size.width;
    CGFloat H = self.frame.size.height;
    
    //按钮的个数
    NSInteger buttonCount = self.subviews.count;
    if (_haveBackgroundImage) {
        
        buttonCount -= 1;
    }
    //有centerView的情况
    //centerView的相关属性
    CGFloat centerW = self.centerView.frame.size.width;
    CGFloat centerH = self.centerView.frame.size.height;
    CGFloat centerX = (W - centerW)/ 2.0f;
    CGFloat centerY;
    if (centerH <= H) {
        centerY = H / 2.0f - centerH / 2.0f;
    }else{
        
        centerY = H - centerH;
    }
    self.centerView.frame = CGRectMake(centerX, centerY, centerW, centerH);
    
    if (self.centerView) {
        
        buttonCount  -= 1;
    }else{
    
        centerW = 0;
        centerH = 0;
        
    }
    
    //按钮的frame相关
    CGFloat buttonY = 0;
    CGFloat buttonH = self.frame.size.height - 5;
    CGFloat buttonW = (W - centerW) / buttonCount;
    CGFloat buttonX;
    
    int  i = 0;
    for (UIView * tView in self.subviews) {
        //拿到按钮
        if ([tView isKindOfClass:[YTTabBarButton class]]) {
            
            YTTabBarButton * button = (YTTabBarButton *)tView;
            
            //计算frame
            //前面部分
            if (i < buttonCount/2) {
                
                buttonX = i * buttonW;
                
            //后面部分
            }else{
            
                buttonX = i * buttonW + centerW;
            }
            
            //设置frmame
            button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            
            //设置默认选中的按钮
            if (i == self.selectedIndex) {
                
                button.isSelected = YES;
            }
            
            //设置tag值
            button.tag = Btn_tag + i;
            
            
            i ++;
        }
        
    }
    
    
}

- (void)setButtonFrame{

    //1.通用属性
    //按钮的个数
    NSInteger buttonCount = self.subviews.count;
    CGFloat buttonY = 0;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonW = self.frame.size.width / buttonCount;
    
    //2.遍历拿到tabBar上所有的按钮
    int i = 0;
    for (YTTabBarButton * button  in self.subviews) {
        CGFloat buttonX = i * buttonW;
        //设置frame
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        //设置tag值
        button.tag = i + Btn_tag;
        
        //设置默认选中的按钮
        if (i == self.selectedIndex) {
            
            button.isSelected = YES;
        }
        
        i++;
    }
}

#pragma mark -centerView赋值
- (void)setCenterView:(UIView *)centerView{

    _centerView = centerView;
    
    //显示在界面上
    UIView * view = [self viewWithTag:Center_tag];
    if (view) {
        [view removeFromSuperview];
    }else{
        _centerView.tag = Center_tag;
        [self addSubview:_centerView];
        
    }
    
}

@end
