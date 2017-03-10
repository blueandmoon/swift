//
//  ButtonExtension.swift
//  TumblrMenu_21
//
//  Created by apple on 2017/3/9.
//  Copyright © 2017年 ligen. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func alignContentVeriticallyByCenter() {
        //  设置按钮图片在上, 文字在下的效果
        contentHorizontalAlignment = .center
        contentVerticalAlignment = .center
        
        //  图片与title之间有一个默认的间隔10
        let offset: CGFloat = 10
        
        //  在现有的iOS版本上, 会出现得不到frame的情况, 加上下面两句会100%得到
        titleLabel?.backgroundColor = backgroundColor
        imageView?.backgroundColor = backgroundColor
        
        //  title
        let titleWidth = titleLabel?.frame.size.width
        let titleHeight = titleLabel?.frame.size.height
        let titleLef = titleLabel?.frame.origin.x
        let titleRig = frame.size.width - titleLef! - titleWidth!
        
        //  img
        let imgWidth = imageView?.frame.size.width
        let imgHeight = imageView?.frame.size.height
        let imgLef = imageView?.frame.origin.x
        let imgRig = frame.size.width - imgWidth! - imgLef!
        
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -imgLef!, bottom: titleHeight!, right: -imgRig)
        titleEdgeInsets = UIEdgeInsets(top: imgHeight! + offset, left: -titleLef!, bottom: 0, right: -titleRig)
        
    }
    
}
