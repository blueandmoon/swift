//
//  ViewController.swift
//  simpleClock
//
//  Created by apple on 2017/2/25.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let showLabel = UILabel(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight/2))
    let beginBtn = UIButton(frame: CGRect(x: 0, y: kScreenHeight/2, width: kScreenWidth/2, height: kScreenWidth/2))
    let pauseBtn = UIButton(frame: CGRect(x: kScreenWidth/2, y: kScreenHeight/2, width: kScreenWidth/2, height: kScreenHeight/2))
    var time:Timer?
    var n = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        
        setUpView()
        
    
        
    
    }
    
    
    func setUpView() {
        showLabel.backgroundColor = .yellow
        beginBtn.backgroundColor = .orange
        pauseBtn.backgroundColor = .blue
        beginBtn.setTitle("开始", for: .normal)
        beginBtn.setTitle("结束", for: .selected)
        pauseBtn.setTitle("暂停", for: .normal)
        pauseBtn.setTitle("继续", for: .selected)
        
        [beginBtn, pauseBtn].forEach { (btn) in
            btn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside);
        }
        
        
        showLabel.text = "0"
        showLabel.textColor = .white
        showLabel.font = UIFont.systemFont(ofSize: kScreenHeight/4, weight: kScreenWidth/4)
        showLabel.textAlignment = .center
        view.addSubview(showLabel)
        view.addSubview(beginBtn)
        view.addSubview(pauseBtn)
    }
    
    func buttonTapped(sender: UIButton) {
        switch sender {
        case beginBtn:
            beginBtn.isSelected = !beginBtn.isSelected
            beginBtn.isSelected ? begin() : stop()
        case pauseBtn:
            pauseBtn.isSelected = !pauseBtn.isSelected
            pauseBtn.isSelected ? pause() : continues()
        default:
            break
        }
    }
    
    //  MARK:   - 操作
    //  TODO:   - 记得做
    //  FIXME:  - 提醒
    func begin() {
        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeLabel), userInfo: nil, repeats: true)
    }
    
    func stop() {
        showLabel.text = "0"
        n = 0;
        time?.invalidate()
        time = nil
    }
    
    func pause() {
        if !beginBtn.isSelected {
            return
        }
        time?.invalidate()
        time = nil
    }
    
    func continues() {
        if !beginBtn.isSelected {
            return
        }
        begin()
    }
    
    func changeLabel() {
        n += 1
        showLabel.text = String(n)
        //s = "\(x)" | toString(x) | x.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

