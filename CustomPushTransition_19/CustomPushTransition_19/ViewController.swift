//
//  ViewController.swift
//  CustomPushTransition_19
//
//  Created by apple on 2017/3/8.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kWidth = kRect.size.width
let kHeight = kRect.size.height

class ViewController: UIViewController {

    //  自定义转场动画, 当前VC需要push新的VC时, 用该方法比较合适
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    view.layer.contents = UIImage(named: "4")?.cgImage
        //  隐藏导航栏
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //  设置自己成为导航栏的代理, 同样可以用在别的Controller的代理
        navigationController?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //  VC继承自UIResponser, 所以会有该方法
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(FirstViewController(), animated: true)
    }


}

extension ViewController: UINavigationControllerDelegate {
    //  返回转场动画
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return PushAnimation()
            
        } else {
            return nil
        }
    }
}

