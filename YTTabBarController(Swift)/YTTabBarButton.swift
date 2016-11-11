//
//  YTTabBarButton.swift
//  01-自定制tabBarController
//
//  Created by 余婷 on 16/9/10.
//  Copyright © 2016年 余婷. All rights reserved.
//

import UIKit

//自定义控件:
//1.声明所有的子视图的属性
//2.在构造方法中将子视图添加到界面上
//3.计算子视图的frame


//1.小图
//2.文字
//3.大图
class YTTabBarButton: UIView {

    //MARK: - 属性
    //1.小图
    let smallImageView = UIImageView()
    //2.文字
    let titleLabel = UILabel()
    //3.大图
    let bigImageView = UIImageView()
    
    ///4.按钮的状态
    var isSelected = false{
    
        didSet{
            
            if isSelected == true {
                self.bigImageView.hidden = false
                self.smallImageView.hidden = true
                self.titleLabel.hidden = true
                
            }else{
                self.bigImageView.hidden = true
                self.smallImageView.hidden = false
                self.titleLabel.hidden = false
            }
        }
    }
    
    //5.保存添加事件相关属性
    var target: AnyObject? = nil
    var action: Selector? = nil
    

    //MARK: - 构造方法
    init(tabBarItem:UITabBarItem){
        super.init(frame: CGRectZero)
        //1.小图
        self.addSubview(self.smallImageView)
        self.smallImageView.image = tabBarItem.image
        self.smallImageView.contentMode = .Center
        //2.文字
        self.addSubview(self.titleLabel)
        self.titleLabel.font = UIFont.systemFontOfSize(11)
        self.titleLabel.text = tabBarItem.title
        self.titleLabel.textAlignment = .Center
        //3.大图
        self.addSubview(self.bigImageView)
        self.bigImageView.image = tabBarItem.selectedImage
        self.bigImageView.contentMode = .Center
        self.bigImageView.hidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - 添加点击事件
extension YTTabBarButton{

    ///添加事件
    func addTarget(target:AnyObject,action:Selector){
        
        self.target = target
        self.action = action
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if self.target == nil {
            return
        }
        
         if (self.target!.respondsToSelector(self.action!) == true){
        
            self.target!.performSelector(self.action!, withObject: self)
        }else{
        
            print("按钮点击方法没有实现")
        }
        
    }
    
    
}

//MARK: - 计算frame
extension YTTabBarButton{

    override func layoutSubviews() {
        super.layoutSubviews()
        
        //通用
        let btnW = self.frame.size.width
        let btnH = self.frame.size.height
        let imageProportion = CGFloat(4)/5
        let beyondH:CGFloat = 25
        //1.小图
        let smallX:CGFloat = 0
        let smallY:CGFloat = 0
        let smallW = btnW
        let smallH = btnH * imageProportion - 2
        self.smallImageView.frame = CGRectMake(smallX, smallY, smallW, smallH)
        //2.文字
        let titleX: CGFloat = 0
        let titleY: CGFloat = smallH
        let titleW = btnW
        let titleH = btnH * (1 - imageProportion)
        self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH)
        //3.大图
        let bigX: CGFloat = 0
        let bigY = -beyondH
        let bigW = btnW
        let bigH = btnH + beyondH
        self.bigImageView.frame = CGRectMake(bigX, bigY, bigW, bigH)
        
        
        //判断当前按钮是否处于选中状态
        if self.isSelected {
            
            self.bigImageView.hidden = false
        }
        
        //设置文字颜色
        self.titleLabel.textColor = UIColor.blackColor()
        
    }
}
