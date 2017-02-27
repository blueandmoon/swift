//
//  ViewController.swift
//  CustomFont
//
//  Created by apple on 2017/2/25.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height
/*
 导入字体步骤:
 1. 下载ttf文件, 加入项目中
 2. 在info.plist中, 添加一个字段: Fonts provided by application
 3. 再添加item, 值写入字体的名字
 4. 然后就可以通过名字使用了
 */

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH), style: .plain)
    let button = UIButton(type: .custom)
    let dataArr = ["点击一下改变字体", "字体就会改变", "Do you believe it?", "不相信", "试一下呗☺"];
    let fontNameArr = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Heiti SC"];
    var fontNumber = 0
    let reuseIdentifier = "reuse"
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        setUpView()
        
    }
    
    func setUpView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .lightGray
        
        button.setTitle("改变字体", for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(changeFont), for: .touchUpInside)
        
        view.addSubview(tableView)
        view.addSubview(button)
        
        _ = tableView.sd_layout().leftEqualToView(view)?.rightEqualToView(view)?.topSpaceToView(view, 20)?.bottomSpaceToView(view, 100)
        _ = button.sd_layout().leftEqualToView(view)?.widthIs(kScreenW)?.topSpaceToView(tableView, 0)?.bottomEqualToView(view)
        
    }
    
    func changeFont() {
        fontNumber = (fontNumber+1)%fontNameArr.count
        tableView.reloadData()
//        print(fontNumber)
    }
    
    //  MARK: - UITableViewDelegate & UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (kScreenH - 120.0)/CGFloat(dataArr.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
         代码创建, 并且没有注册cell的情况下, 用dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell?
         如果已经注册了, 或者用xib, 就使用dequeueReusableCel(withIdentifier identifier: String, for indexPath: IndexPah) -> UITableViewCell
         */
        //  ?? 空合运算符, a ?? b, 对可选类型a进行判断, 为nil默认值为b, 不为空就解封
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        let text = dataArr[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = .orange
        cell.textLabel?.font = UIFont(name: fontNameArr[fontNumber], size: 24)
        print("\(cell.textLabel?.font.fontName)______\(fontNameArr[fontNumber])");
        cell.backgroundColor = .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  取消点击效果
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        
        let str = "当前字体是: " + (cell?.textLabel?.font.fontName)!
        print(str)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

