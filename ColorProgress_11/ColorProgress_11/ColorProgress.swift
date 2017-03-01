//
//  ColorProgress.swift
//  ColorProgress_11
//
//  Created by apple on 2017/3/1.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

class ColorProgress: UIView, CAAnimationDelegate {

    let gradientLayer = CAGradientLayer()
    let maskLayer = CALayer()
    var progress: CGFloat = 0.0 {
        didSet {
            changeMaskFrame()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setUpView() {
        let  whiteBg = CALayer()
        whiteBg.frame = bounds
        whiteBg.cornerRadius = bounds.size.height/2.0
        whiteBg.borderColor = UIColor.white.cgColor
        whiteBg.borderWidth = 1.0
        layer.addSublayer(whiteBg)
        
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = bounds.size.height/2.0
        gradientLayer.borderColor = UIColor.white.cgColor
        gradientLayer.borderWidth = 1.0
        var colors = [CGColor]()
        for hue in stride(from: 0, to: 360, by: 5) {
            let color = UIColor(hue: CGFloat(hue)/360.0, saturation: 1.0, brightness: 1.0, alpha: 1).cgColor
            colors.append(color)
        }
        
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.addSublayer(gradientLayer)
        
        //  添加显示区域
        
        
    }
    
    private func changeMaskFrame() {
        maskLayer.frame = CGRect(x: 0.0, y: 0.0, width: progress*bounds.size.width, height: bounds.size.height)
    }
    
    private func performAnimation() {
        var colors = gradientLayer.colors
        let color = colors?.popLast() as! CGColor
        
        
    }
    
    

}
