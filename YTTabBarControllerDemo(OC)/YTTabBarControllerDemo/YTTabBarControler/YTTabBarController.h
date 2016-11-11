//
//  YTTabBarController.h
//  02-自定制TabBar
//
//  Created by 余婷 on 16/6/4.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTTabBarController : UITabBarController

- (void)addController:(UIViewController *)controller WithTitle:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName;

//中间显示的view
@property(nonatomic, strong) UIView * centerView;

@end
