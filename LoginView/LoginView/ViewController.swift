//
//  ViewController.swift
//  LoginView
//
//  Created by apple on 2017/3/10.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kWidth = kRect.size.width
let kHeight = kRect.size.height

class ViewController: UIViewController {

    let nameF = UITextField(frame: CGRect(x: 20, y: kHeight/2, width: kWidth - 40, height: 30))
    let passwordF = UITextField(frame: CGRect(x: 20, y: kHeight/2 + 30 + 10, width: kWidth - 40, height: 30))
    let loginBtn = UIButton(frame: CGRect(x: 20, y: kHeight/2 + 30*2 + 30, width: kWidth - 40, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    
    func setUpView() {
        view.backgroundColor = .white
        nameF.modificationTextField(placeholder: "请输入手机号", keyboardType: .numberPad, text: nil)
        passwordF.modificationTextField(placeholder: "请输入密码", keyboardType: .asciiCapable, text: nil)
        loginBtn.modificationButton(title: "登录")
        
        view.addSubview(nameF)
        view.addSubview(passwordF)
        view.addSubview(loginBtn)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notify: NSNotification) {
        let keyboardHeight = (notify.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        Log("键盘高度 : \(keyboardHeight)")
        if keyboardHeight/2 == -view.frame.origin.y {
            Log("无需再次移动")
            return
        }
        
        UIView.animate(withDuration: 1) { 
            self.view.frame = CGRect(x: 0, y: -keyboardHeight/2, width: kWidth, height: kHeight)
        }
        
    }

    func keyboardWillHide() {
        if view.frame.origin.x == 0 {
            Log("无需再次复位!")
        }
        UIView.animate(withDuration: 1) { 
            self.view.frame = kRect
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

