//
//  AppDelegate.m
//  YTTabBarControllerDemo
//
//  Created by 余婷 on 16/11/11.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "YTTabBarControler/YTTabBarController.h"

@interface AppDelegate ()<UIAlertViewDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    YTTabBarController * tabBarController = [[YTTabBarController alloc] init];
    
    [tabBarController addController:[OneViewController new] WithTitle:@"条漫" imageName:@"faxian_u" selectImageName:@"faxian_d"];
    [tabBarController addController:[TwoViewController new] WithTitle:@"发现" imageName:@"tiaoman_u" selectImageName:@"tiaoman_d"];
    [tabBarController addController:[ThreeViewController new] WithTitle:@"绘本" imageName:@"huiben_u" selectImageName:@"huiben_d"];
    [tabBarController addController:[FourViewController new] WithTitle:@"我的" imageName:@"wode_u" selectImageName:@"wode_d"];
    
    
    UIButton * centerView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 56, 56)];
    [centerView setImage:[UIImage imageNamed:@"center"] forState:UIControlStateNormal];
    [centerView addTarget:self action:@selector(centerAction) forControlEvents:UIControlEventTouchDown];
    tabBarController.centerView = centerView;
    
    
//    tabBarController.
    [self.window setRootViewController:tabBarController];
    
    
    
    return YES;
}


- (void)centerAction{

    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"中间按钮被点击" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alert show];
}


@end
