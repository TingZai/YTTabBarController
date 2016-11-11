//
//  YTTabBarController.swift
//  01-自定制tabBarController
//
//  Created by 余婷 on 16/9/10.
//  Copyright © 2016年 余婷. All rights reserved.
//

import UIKit

class YTTabBarController: UITabBarController {
    
    //MARK: - 属性
    lazy var yt_tabBar:YTTabBar = {
    
        //自己定义的tabBar的大小和系统自带的tabBar的大小一样
        let tempTabBar = YTTabBar(frame:self.tabBar.bounds)
        
        //点击tabBar上的按钮去切换视图控制器
        tempTabBar.changeSelectedIndex = {(index)in
        
            //切换到指定的视图控制器
            self.selectedIndex = index
        }
        
        //将自定义的tabBar贴到系统的tabBar上
        self.tabBar.addSubview(tempTabBar)
        
        
        return tempTabBar
    }()

    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //设置默认选中的按钮
        self.yt_tabBar.selectedIndex = self.selectedIndex
        
        //改变文字颜色
        self.yt_tabBar.titleColor = UIColor.lightGrayColor()
        
        //移除tabBar上自动添加的所有的子视图
        for item in self.tabBar.subviews {
            //判断子视图的类型是否是YTTabBar
            //isKindOfClass判断指定的对象是否是指定的类型
            if item.isKindOfClass(YTTabBar.self) {
                continue
            }
            
            //将不是YTTabBar的从系统的tabBar上移除
            item.removeFromSuperview()
            
        }
        
    }
    
    
}

//MARK: - 添加子视图控制器
extension YTTabBarController{
    
    ///添加子视图控制器
    func addController(controller:UIViewController,title:String,imageName:String,selectImageName:String){
        
        //设置视图控制器对一个的tabBarItem
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage.init(named: imageName)?.imageWithRenderingMode(.AlwaysOriginal)
        controller.tabBarItem.selectedImage = UIImage.init(named: selectImageName)?.imageWithRenderingMode(.AlwaysOriginal)
        //将视图控制器添加到tabBarController中
        self.addChildViewController(controller)
        
        //在yt_tabBar上创建对应按钮
        self.yt_tabBar.addButtonWithItem(controller.tabBarItem)
        
    }
}
