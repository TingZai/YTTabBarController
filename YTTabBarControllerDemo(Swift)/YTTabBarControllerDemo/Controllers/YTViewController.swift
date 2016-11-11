//
//  YTViewController.swift
//  YTTabBarControllerDemo
//
//  Created by 余婷 on 16/11/11.
//  Copyright © 2016年 余婷. All rights reserved.
//

import UIKit

class YTViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.init(red: CGFloat(arc4random()%256) / 255, green: CGFloat(arc4random()%256) / 255, blue: CGFloat(arc4random()%256) / 255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
