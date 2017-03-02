//
//  ViewController.swift
//  ColorProgress_11
//
//  Created by apple on 2017/3/1.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kWidth = kRect.size.width
let kHeight = kRect.size.height
let progressRect = CGRect(x: 20, y: 200, width: kWidth - 40, height: 20)

class ViewController: UIViewController {

    let colorProgress = ColorProgress(frame: progressRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (time) in
            self.colorProgress.progress += 0.01
            if self.colorProgress.progress >= 1.01 {
                ////                time.invalidate()
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2.0 * Double(NSEC_PER_SEC))), execute: {
//                    self.colorProgress.progress = 0.0
////                    time.fire()
//                })
                self.colorProgress.progress = 0.0
            }
        }
        
    }
    
    func setUpView() {
        view.backgroundColor = .black
        view.addSubview(colorProgress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

