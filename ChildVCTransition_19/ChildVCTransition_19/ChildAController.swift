//
//  ChildAController.swift
//  ChildVCTransition_19
//
//  Created by apple on 2017/3/7.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

class ChildAController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        //  添加一个点击手势
        let tap = UITapGestureRecognizer(target: self, action: #selector(jump))
        view.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func jump() {
        //  发送跳转通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JumpNotification), object: nil)
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
