//
//  UITextFieldExtension.swift
//  LoginView
//
//  Created by apple on 2017/3/10.
//  Copyright © 2017年 ligen. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func modificationTextField(placeholder: String, keyboardType: UIKeyboardType, text: String?) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.text = text
        layer.cornerRadius = 5
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        textAlignment = .center
        clearButtonMode = .whileEditing
    }
}

extension UIButton {
    func modificationButton(title: String, bgColor: UIColor = .orange) {
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = bgColor
        layer.cornerRadius = 5
    }
}

extension Date {
    static func getCurrentTime() -> String {
        let date = Date()
        let formate = DateFormatter()
        formate.dateFormat = "yyyy-MM-dd HH:mm:ss:SSS"
        return formate.string(from: date)
    }
}

func Log(_ message: Any) {
    #if DEBUG
        print("\(Date.getCurrentTime()) | \(#line) | \(URL(fileURLWithPath: #file).lastPathComponent) || \(message)")
    #endif
}
