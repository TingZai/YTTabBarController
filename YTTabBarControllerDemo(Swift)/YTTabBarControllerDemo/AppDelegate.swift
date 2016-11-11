//
//  AppDelegate.swift
//  YTTabBarControllerDemo
//
//  Created by 余婷 on 16/11/11.
//  Copyright © 2016年 余婷. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        
        let tabBarController = YTTabBarController()
        tabBarController.addController(OneViewController(), title: "条漫", imageName: "faxian_u", selectImageName: "angry-minion-icon")
        tabBarController.addController(TwoViewController(), title: "绘本", imageName: "huiben_u", selectImageName: "curious-minion-icon")
        tabBarController.addController(ThreeViewController(), title: "专题", imageName: "zhuanti_u", selectImageName: "despicable-me-2-minion-icon-5")
        tabBarController.addController(FourViewController(), title: "我的", imageName: "wode_u", selectImageName: "despicable-me-2-minion-icon-7")
        
        
        tabBarController.hiddenTabBarLine = false
        
        self.window?.rootViewController = tabBarController
        
        return true
    }

}

