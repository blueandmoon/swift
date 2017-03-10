//
//  ViewController.swift
//  WaveView_14
//
//  Created by apple on 2017/3/6.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kWidth = kRect.size.width
let kHeight = kRect.size.height

class ViewController: UIViewController {

    let wave = WaveView(frame: CGRect(x: 0.0, y: 200.0, width: kWidth, height: 31))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setUpView()
    }
    
    func setUpView() {
        wave.waveSpeed = 10
        wave.angularSpeed = 1.5
        view.addSubview(wave)
        
        let whiteView = UIView(frame: CGRect(x: 0.0, y: 230, width: kWidth, height: kHeight - 230))
        whiteView.backgroundColor = .white
        view.addSubview(whiteView)
        
        let btn = UIButton(frame: CGRect(x: 100, y: 400, width: kWidth - 200, height: 30))
        btn.setTitle("开始", for: .normal)
        btn.setTitle("结束", for: .selected)
        btn.setTitleColor(.orange, for: .normal)
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(changeStatus(_:)), for: .touchUpInside)
        
        
        
    }
    
    func changeStatus(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.isSelected ? wave.startWave() : wave.stopWaver()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

