//
//  ViewController.swift
//  ChildVCTransition_19
//
//  Created by apple on 2017/3/7.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kWidth = kRect.size.width
let kHeight = kRect.size.height

let JumpNotification = "JUMP"

class ViewController: UIViewController {

    var curChildNumber = 0
    
    //  最简单的转场实现方式, 该方式是在ViewController的子VC之间转场
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpChild()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    private func setUpChild() {
        addChildViewController(ChildAController())
        addChildViewController(ChildBController())
        
        view.addSubview((childViewControllers.first?.view)!)
        
        //  监听跳转通知, NOtificationCenter通知中心
        NotificationCenter.default.addObserver(self, selector: #selector(jump), name: NSNotification.Name(rawValue: JumpNotification), object: nil)

        
    }
    
    func jump() {
        //  opions: 跳转的方式
        transition(from: (curChildNumber == 0 ? childViewControllers.first! : childViewControllers.last!), to: (curChildNumber == 0 ? childViewControllers.last! : childViewControllers.first!), duration: 0.5, options: (curChildNumber == 0 ? .transitionFlipFromLeft : .transitionFlipFromTop), animations: nil, completion: nil)
        curChildNumber = curChildNumber == 0 ? 1 : 0
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: JumpNotification), object: nil)
    }

}

