//
//  ViewController.swift
//  SystemrefreshControl_07
//
//  Created by apple on 2017/2/28.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kWidth = kRect.size.width
let kHeight = kRect.size.height

class ViewController: UIViewController {

    let tableView = UITableView(frame: kRect, style: .plain)
    let refreshControl = UIRefreshControl()
    
    var dataArr = ["为你而战, 我的女士", "验证一下下拉刷新控件", "复活吧我的勇士", "冰封王座", "哼哈"]
    let reuseIdentifier = "refreshCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpView()
    }
    
    func setUpView() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        tableView.refreshControl = refreshControl
        refreshControl.backgroundColor = .gray
        refreshControl.attributedTitle = NSAttributedString(string: "最后一次刷新:\(NSDate())", attributes: [NSForegroundColorAttributeName:UIColor.white])   //  文字的颜色
        refreshControl.tintColor = .orange
        refreshControl.addTarget(self, action: #selector(addContent), for: .valueChanged)
        
        view.addSubview(tableView)
    }
    
    func addContent() {
        dataArr.append(dataArr[0])
        tableView.reloadData()
        refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) ?? UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        
        cell.textLabel?.text = String(indexPath.row + 1) + ":" + dataArr[indexPath.row]
        cell.textLabel?.textColor = .purple
        cell.textLabel?.backgroundColor = .clear
        cell.textLabel?.font = UIFont.systemFont(ofSize: 30, weight: 10)
        
        return cell
    }
    
    
    
    
}
