//
//  ViewController.swift
//  AnimatedSplash
//
//  Created by apple on 2017/3/7.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kWidth = kRect.size.width
let kHeight = kRect.size.height

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let iv = UIImageView(frame: kRect)
//        iv.image = #imageLiteral(resourceName: "twitterscreen")
//        view.addSubview(iv)
        
        view.layer.contents = #imageLiteral(resourceName: "twitterscreen").cgImage
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

