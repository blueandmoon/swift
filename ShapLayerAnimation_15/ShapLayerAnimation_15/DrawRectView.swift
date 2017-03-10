//
//  DrawRectView.swift
//  ShapLayerAnimation_15
//
//  Created by apple on 2017/3/6.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

class DrawRectView: UIView {

    var tap: UITapGestureRecognizer?
    
    func removeSelf() {
        self.removeFromSuperview()
    }
    
    override func draw(_ rect: CGRect) {
        if tap == nil {
            tap = UITapGestureRecognizer(target: self, action: #selector(removeSelf))
            addGestureRecognizer(tap!)
        }
        
        simpleDraw()
        pathARC()
        pathTriangle()
        pathSecondBezier()
    }

    //  圆角矩形
    private func simpleDraw() {
        let rect = CGRect(x: 20, y: 20, width: 100, height: 100)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 20)
        path.lineWidth = 3
        //  填充颜色
        UIColor.purple.set()
        path.fill()
        //  线条颜色
        UIColor.red.set()
        path.stroke()
    }
    
    //  圆弧
    private func pathARC() {
        let path = UIBezierPath(arcCenter: CGPoint(x: 120, y: 150), radius: 100, startAngle: 0, endAngle: CGFloat(M_PI * 1.3), clockwise: true)
        //  连接样式
        path.lineCapStyle = .round
        //  连接方式
        path.lineJoinStyle = .round
        path.lineWidth = 3
        
        UIColor.green.set()
        path.stroke()
    }
    
    //  三角形
    private func pathTriangle() {
        let path = UIBezierPath()
        //  起点
        path.move(to: CGPoint(x: 20, y: 300))
        path.addLine(to: CGPoint(x: 150, y: 500))
        path.addLine(to: CGPoint(x: 20, y: 400))
        path.close()
        
        path.lineWidth = 3
        
        UIColor.green.set()
        path.fill()
        
        UIColor.purple.set()
        path.stroke()
        
    }
    
    //  贝塞尔曲线
    private func pathSecondBezier() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 200, y: 500))
        path.addQuadCurve(to: CGPoint(x: 200, y: 300), controlPoint: CGPoint(x: 300, y: 350))
        path.lineWidth = 6
        
        UIColor.purple.set()
        path.stroke()
        
    }
    
    
}
