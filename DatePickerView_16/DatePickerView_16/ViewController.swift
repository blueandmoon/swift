//
//  ViewController.swift
//  DatePickerView_16
//
//  Created by apple on 2017/3/7.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kWidth = kRect.size.width
let kHeight = kRect.size.height

let PickerViewRect = CGRect(x: 0, y: kHeight/3, width: kWidth, height: kHeight/3)
let LabelRect = CGRect(x: 0, y: 20, width: kWidth, height: kHeight/3 - 20)
let BtnRect = CGRect(x: 40, y: PickerViewRect.origin.y+PickerViewRect.size.height + 30, width: kWidth - 80, height: 30)



class ViewController: UIViewController {

    let pickerView = UIPickerView(frame: PickerViewRect)
    let showLabel = UILabel(frame: LabelRect)
    let btn = UIButton(frame: BtnRect)
    let hours = 0...23
    let mins = 0...59
    let secs = 0...59
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeLabelTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpView() {
        view.backgroundColor = .white
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(0, inComponent: 0, animated: true)
        
        showLabel.textColor = .orange
        showLabel.font = UIFont.systemFont(ofSize: 30, weight: 5)
        showLabel.textAlignment = .center
        
        btn.setTitle("随机选择", for: .normal)
        btn.setTitleColor(.orange, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: 5)
        btn.addTarget(self, action: #selector(randomTime), for: .touchUpInside)
        
        view.addSubview(pickerView)
        view.addSubview(showLabel)
        view.addSubview(btn)
    }
    
    func changeLabelTitle() {
        showLabel.text = "\(pickerView.selectedRow(inComponent: 0))时 \(pickerView.selectedRow(inComponent: 1))分 \(pickerView.selectedRow(inComponent: 2))秒"
    }
    
    func randomTime() {
        pickerView.selectRow(Int(arc4random())%hours.count, inComponent: 0, animated: true)
        pickerView.selectRow(Int(arc4random())%mins.count, inComponent: 1, animated: true)
        pickerView.selectRow(Int(arc4random())%secs.count, inComponent: 2, animated: true)
        changeLabelTitle()
    }


}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return hours.count
        case 1:
            return mins.count
        default:
            return secs.count
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return kWidth/3
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        changeLabelTitle()
    }

//    //  系统样式
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        switch component {
//        case 0:
//            return String(Array(hours)[row]) + "时"
//        case 1:
//            return String(Array(mins)[row]) + "分"
//        default:
//            return String(Array(secs)[row]) + "秒"
//        }
//    }
    
//    自定义样式
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        switch component {
        case 0:
            pickerLabel.text = String(Array(hours)[row]) + "时"
        case 1:
            pickerLabel.text = String(Array(mins)[row]) + "分"
        default:
            pickerLabel.text = String(Array(secs)[row]) + "秒"
        }
        
        pickerLabel.textColor = .green
        pickerLabel.font = UIFont.systemFont(ofSize: 18, weight: 5)
        pickerLabel.textAlignment = .center
        
        return pickerLabel
    }
    
}

