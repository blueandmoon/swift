//
//  ViewController.swift
//  TableHeaderView_12
//
//  Created by apple on 2017/3/2.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kWidth = kRect.size.width
let kHeight = kRect.size.height

let HeaderViewHeight = kHeight/3.0


class ViewController: UIViewController {

    let dataArr = ["下拉刷新试一下", "为你而战, 我的女士", "复活吧, 我的勇士", "不努力的人, 要向好色那样好学", "愚蠢的时代, 绝望的时代", "天行健, 君子以自强不息"]
    let tableView = UITableView(frame: kRect, style: .plain)
    let reuseId = "reuseCell"
    let headerView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: kWidth, height: kHeight))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpView()
    }
    
    func setUpView() {
        self.automaticallyAdjustsScrollViewInsets = false
        
        headerView.backgroundColor = .white
        headerView.contentMode = .scaleAspectFill
        headerView.clipsToBounds = true
        view.addSubview(headerView)
        
        //  加载图片
        let urlStr = URL(string: "http://c.hiphotos.baidu.com/zhidao/pic/item/5ab5c9ea15ce36d3c704f35538f33a87e950b156.jpg");
        let task = URLSession.shared.dataTask(with: urlStr!) { (data, response, error) in
            guard let _ = data, error == nil else { return }
            //  回到主线程
            DispatchQueue.main.sync {
                self.headerView.image = UIImage(data: data!)
            }
        }
        
        task.resume()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseId)
        tableView.showsVerticalScrollIndicator = false
        //  下面两句必不可少, 否则会出现第一次加载时位置不对的情况
        tableView.contentInset.top = HeaderViewHeight
        tableView.contentOffset = CGPoint(x: 0.0, y: -HeaderViewHeight)
        
        view.addSubview(tableView)
        view.sendSubview(toBack: tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    //  delegate & dataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
        cell.textLabel?.text = dataArr[indexPath.row]
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let  offSety = scrollView.contentOffset.y + scrollView.contentInset.top
        if offSety <= 0 {
            headerView.frame = CGRect(x: 0.0, y: 0.0, width: kWidth, height: HeaderViewHeight - offSety)
        } else {
            let height = (HeaderViewHeight - offSety) <= 0.0 ? 0.0 : (HeaderViewHeight - offSety)
            headerView.frame = CGRect(x: 0.0, y: 0.0, width: kWidth, height: height)
            headerView.alpha = height/HeaderViewHeight
        }
        
    }
    
    
}

