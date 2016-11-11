//
//  YTTabBar.swift
//  01-自定制tabBarController
//
//  Created by 余婷 on 16/9/10.
//  Copyright © 2016年 余婷. All rights reserved.
//

import UIKit

class YTTabBar: UIView {

    
    //MARK: - 属性
    ///1.当前选中的下标
    var selectedIndex = 1
    
    ///2.声明闭包用来传值
    var changeSelectedIndex:((Int)->Void)? = nil
    
    ///3.设置按钮的文字颜色
    var titleColor = UIColor.blackColor()
    
}

//MARK: - 添加按钮
extension YTTabBar{

    ///添加按钮
    func addButtonWithItem(item:UITabBarItem) {
        
        //创建按钮
        let btn = YTTabBarButton(tabBarItem: item)
        //添加点击事件
        btn.addTarget(self, action: "btnAction:")
        
        //设置按钮的tag值
        btn.tag = 100+self.subviews.count
        
//        //判断是否是需要选中按钮
//        if self.selectedIndex == self.subviews.count{
//            
//            btn.isSelected = true
//        }
        
        //添加到界面上
        self.addSubview(btn)
    }
}

//MARK: - 按钮点击
extension YTTabBar{

    func btnAction(btn:YTTabBarButton){
        
        //将原来处于选中状态的按钮变成非选中状态
        let selectBtn = self.viewWithTag(100+self.selectedIndex) as! YTTabBarButton
        selectBtn.isSelected = false
        
        //将当前按下的按钮变成选中状态
        btn.isSelected = true
        //更新选中下标
        self.selectedIndex = btn.tag - 100
        
        //通知tabBarController切换视图控制器
        self.changeSelectedIndex!(self.selectedIndex)
        
    }
}

//MARK: - 计算子视图的frame
extension YTTabBar{

    override func layoutSubviews() {
        super.layoutSubviews()
        
        //通用
        let btnW = self.frame.size.width / CGFloat(self.subviews.count)
        let btnH = self.frame.size.height
        let btnY:CGFloat = 0
        
        //遍历拿到所有的按钮
        for (i,item) in self.subviews.enumerate() {
            
            let btn = item as! YTTabBarButton
            
            let btnX = CGFloat(i) * btnW
            //1.设置frame
            item.frame = CGRectMake(btnX, btnY, btnW, btnH)
            
            //2.设置默认选中的按钮
            if i == self.selectedIndex {
                
                btn.isSelected = true
            }
            //3.设置按钮颜色
            btn.titleLabel.textColor = self.titleColor
            
        }
        
        
        
    }
}
