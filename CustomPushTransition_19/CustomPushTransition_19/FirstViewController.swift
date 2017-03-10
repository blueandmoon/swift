//
//  FirstViewController.swift
//  CustomPushTransition_19
//
//  Created by apple on 2017/3/8.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.layer.contents = UIImage(named: "8")?.cgImage
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //  swift中, pop一个VC后, 会返回该VC, 如果忽略改返回值, 会有一个警告, 需要写上 _, 相当于告诉编辑器, 我知道有返回值, 但是不处理
        //  其他带返回值的方法同样处理
        let _ = navigationController?.popViewController(animated: true)
        
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

extension FirstViewController: UINavigationControllerDelegate {
    //  返回转场动画
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .pop {
            return PopAnimation()
            
        } else {
            return nil
        }
    }
}
