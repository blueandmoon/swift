//
//  MenuViewController.swift
//  TumblrMenu_21
//
//  Created by apple on 2017/3/9.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var btns = [UIButton]()
    let transitionManager = MenuTransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 1, alpha: 0.5)
        setUpView()
    }
    
    func setUpView() {
        transitioningDelegate = transitionManager
        let width:CGFloat = kWidth/2
        let height: CGFloat = kHeight/3
        let names = ["Audio", "Chat", "Link", "Photo", "Quote", "Text"]
        for index in 0...5 {
            let rect = CGRect(x: width*CGFloat(index%2), y: height*CGFloat(index/2), width: width, height: height)
            let btn = UIButton(frame: rect)
            btn.setTitle(names[index], for: .normal)
            btn.setImage(UIImage(named: names[index]), for: .normal)
            view.addSubview(btn)
            btn.alignContentVeriticallyByCenter()
            btn.addTarget(self, action: #selector(dismissView(_:)), for: .touchUpInside)
            btns.append(btn)
            btn.tag = index
        }
        
        
        
    }
    
    func dismissView(_ sender: UIButton) {
        print("当前点击的是 \(sender.tag) 个按钮")
        dismiss(animated: true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
