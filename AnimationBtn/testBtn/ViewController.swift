//
//  ViewController.swift
//  testBtn
//
//  Created by apple on 2017/2/24.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selectionAnimationBtn:UIButton_SelectionAnimation!
    var pressBtn:UIButton_PressAnimation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white;
        
        //  点击动画按钮
        self.selectionAnimationBtn = UIButton_SelectionAnimation(type: .custom)
        self.view.addSubview(self.selectionAnimationBtn)
        selectionAnimationBtn.frame = CGRect(x: 100, y: 100, width: 30, height: 30)
        selectionAnimationBtn.addTarget(self, action: #selector(selectBtnClick), for: .touchUpInside);
        
        setUpSelectionAnimationButton()
        
        //  按压动画按钮
        pressBtn = UIButton_PressAnimation(type: .custom)
        self.view.addSubview(pressBtn)
        pressBtn.frame = CGRect(x: 100, y: 150, width: 30, height: 30)
        pressBtn.addTarget(self, action: #selector(pressBtnClick), for: .touchUpInside);
        
        setUpPressAnimationBtn()
        
        
    }
    
    //  1. Begin: Selection animation related
    func setUpSelectionAnimationButton() {
        self.selectionAnimationBtn.setDefaultImage(withName: "stop")
        let selectedColor = UIColor.red
        self.selectionAnimationBtn.setSelectedImage(withName: "stop", withColor: selectedColor)
    }
    
    func selectBtnClick() {
        let isBtnSelected = self.selectionAnimationBtn.isSelected;
        self.selectionAnimationBtn.setSelected(!isBtnSelected, withAnimation: true);
        
    }
    
    
    func setUpPressAnimationBtn() {
        self.pressBtn.setDefaultImage(withName: "stop")
        let selectedColor = UIColor.purple
        self.pressBtn.setSelectedImage(withName: "stop", withColor: selectedColor)
        self.pressBtn.animateOnPress(true)
        
    }
    
    func pressBtnClick() {
        self.pressBtn.isSelected = !self.pressBtn.isSelected
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

