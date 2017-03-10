//
//  ViewController.swift
//  ShapLayerAnimation_15
//
//  Created by apple on 2017/3/6.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kWidth = kRect.size.width
let kHeight = kRect.size.height

class ViewController: UIViewController {

    let btn1 = UIButton(frame: CGRect(x: 100, y: 200, width: kWidth - 200, height: 30))
    let btn2 = UIButton(frame: CGRect(x: 100, y: 300, width: kWidth - 200, height: 30))
    
    var drawView = DrawRectView(frame: CGRect(x: 0, y: 64, width: kWidth, height: kHeight - 64))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    func setUpView() {
        title = "画图与动画"
        view.backgroundColor = .white
        
        btn1.setTitle("DrawRect", for: .normal)
        btn1.setTitleColor(.orange, for: .normal)
        btn2.setTitle("CAShapeLayer", for: .normal)
        btn2.setTitleColor(.orange, for: .normal)
        
        btn1.addTarget(self, action: #selector(showView), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(showView), for: .touchUpInside)
        
        view.addSubview(btn1)
        view.addSubview(btn2)
    }
    
    func showView(_ sender: UIButton) {
        if sender.currentTitle == "DrawRect" {
            print("采用drawrect画图")
            view.addSubview(drawView)
        } else {
            print("采用cashapelayer画图")
            navigationController?.pushViewController(ShapeLayerAnimationController(), animated: true)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

