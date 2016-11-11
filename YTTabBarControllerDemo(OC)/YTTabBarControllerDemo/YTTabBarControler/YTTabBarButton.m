//
//  YTTabBarButton.m
//  02-自定制TabBar
//
//  Created by 余婷 on 16/6/4.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "YTTabBarButton.h"

@interface YTTabBarButton(){

    id _target;
    SEL _action;
}

//=======子视图=========
//图片
@property(nonatomic, strong) UIImageView * imageView;
//文字
@property(nonatomic, strong) UILabel * textLabel;



@end

@implementation YTTabBarButton

#pragma mark - 按钮点击事件
- (void)addTarget:(id)target action:(SEL)action{

    _target = target;
    _action = action;
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        //设置属性的默认值
        self.selectColor = [UIColor redColor];
        self.normalColor = [UIColor grayColor];
        
    }
    
    return self;
}

- (instancetype)init{

    if (self = [super init]) {
        
        //设置属性的默认值
        self.selectColor = [UIColor redColor];
        self.normalColor = [UIColor grayColor];
    }
    return self;
}

#pragma mark - 改变状态
- (void)setIsSelected:(BOOL)isSelected{

    _isSelected = isSelected;
    
    if (isSelected) {
        
        self.imageView.image = self.item.selectedImage;
        self.textLabel.textColor = self.selectColor;
    }else{
    
        self.imageView.image = self.item.image;
        self.textLabel.textColor = self.normalColor;
    }
    
}

#pragma mark - 添加事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

//    if (self.isSelected) {
//        
//        self.isSelected = NO;
//    }else{
//    
//        self.isSelected = YES;
//    }
    
    //响应点击事件
    if ([_target respondsToSelector:_action]) {
        
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [_target performSelector:_action withObject:self];
    #pragma clang diagnostic pop
        
        
    }
}

#pragma mark - 创建界面
//去创建子视图
- (void)setItem:(UITabBarItem *)item{

    _item = item;
    
    //移除按钮上原来的子视图
    for (UIView *view in self.subviews) {
        
        [view removeFromSuperview];
    }
    
    //创建对应的子视图
    //1.图片
    if (item.image || item.selectedImage) {
        
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        _imageView.image = item.image;
        [_imageView setContentMode:UIViewContentModeCenter];
    }
    
    //2.文字
    if (item.title) {
        
        _textLabel = [[UILabel alloc] init];
        [self addSubview:_textLabel];
        _textLabel.text = item.title;
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = [UIFont systemFontOfSize:12];
    }
}

#pragma mark - 计算frame
- (void)layoutSubviews{

    [self setSubViewFrame];
}

//计算frame
- (void)setSubViewFrame{

    //通用
    CGFloat buttonW = self.frame.size.width;
    CGFloat buttonH = self.frame.size.height;
    
    //1.计算图片的frame
    if (_imageView) {
        
        CGFloat imageX = 0;
        CGFloat imageY = 0;
        CGFloat imageW = buttonW;
        CGFloat imageH;
        
        if (_textLabel) {
            //有文字
            imageH = buttonH * 4 / 5.0f;
            
        }else{
            //没有文字
            imageH = buttonH;
        }
        
        _imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    }
    
    //2.计算文字的frame
    if (_textLabel) {
        
        CGFloat textX = 0;
        CGFloat textW = buttonW;
        CGFloat textY;
        CGFloat textH;
        
        if (_imageView) {
            //有图片
            textY = buttonH * 4 / 5.0f;
            textH = buttonH / 5.0f;
            
        }else{
            //没有图片
            textY = 0;
            textH = buttonH;
        }
        
        _textLabel.frame = CGRectMake(textX, textY, textW, textH);
        
    }
    
}

@end
