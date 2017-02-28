//
//  ViewController.swift
//  PlayLocalVideo_03
//
//  Created by apple on 2017/2/27.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

let kScreenRect : CGRect = UIScreen.main.bounds
let kScreenWidth : CGFloat = UIScreen.main.bounds.width
let kScreenHeight : CGFloat = UIScreen.main.bounds.height

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView(frame: kScreenRect, style: .plain)
    var playViewController: AVPlayerViewController?
    var playView: AVPlayer?
    let reuseIdentifier = "videoCell"
    let dateArr = [VideoModel(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
                   VideoModel(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
                   VideoModel(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
                   VideoModel(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
                   VideoModel(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
                   VideoModel(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        setUpView()
    }
    
    func setUpView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(VideoCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
    }
    
    func playVideo() {
        /*
         错误处理:
         1. throwing, 把函数抛出的错误传递给调用此函数的代码
         2. do-catch
         3. 将错误作为可选类型处理
         4. 断言此错误根本不会发生
         */
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        /*
         guard与if很相似, 区别:
            1. guard必须强制有else语句
            2. 只有guard审查条件成立, guard之后的代码才会成立
         */
        
        if path == nil {
            print("没有该文件")
            return
        }
        //  由于返回来可选类型, 并且通过上方判断, 可以确定是有值的, 然后强制解包
        playView = AVPlayer(url: URL(fileURLWithPath: path!))
        playViewController = AVPlayerViewController()
        playViewController?.player = playView
        self.present(playViewController!, animated: true) { 
            self.playView?.play()
        }
        
        
        
    }
    
    //  MARK: - delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kScreenHeight/3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
         !强制解析值, 解析前一定确保可选是有值的
         
         类型转换:
         as? : 返回一个向下转型的类型的可选值
         as! : 强制转型, 并且解包
         is  : 检查能够向下转化成指定类型
         as  : 向上转换成超类
         当不确定是否可以转成功时, 用as?, 确定时, 用as!
         */
        let cell  = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! VideoCell
        cell.setModel(model: dateArr[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        playVideo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

