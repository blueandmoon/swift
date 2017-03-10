//
//  ViewController.swift
//  URLImage_23
//
//  Created by apple on 2017/3/10.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kWidth = kRect.size.width
let kHeight = kRect.size.height

let imgURL = "http://c.hiphotos.baidu.com/zhidao/pic/item/5ab5c9ea15ce36d3c704f35538f33a87e950b156.jpg"

class ViewController: UIViewController, URLSessionDownloadDelegate {

    let dataArr = ["普通方式打开", "普通方式下载图片", "自定义方式下载图片", "带进度的下载方式"]
    var ivArr = [UIImageView]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setUpView() {
        for (index, (x, y)) in [(0, 0), (1, 0), (0, 1), (1, 1)].enumerated() {
            ivArr.append(build(rect: CGRect(x:kWidth/2*CGFloat(x), y: kHeight/2*CGFloat(y), width: kWidth/2, height: kHeight/2), tag: index, title: dataArr[index]))
        }
    }
    
    func build(rect: CGRect, tag: Int, title: String) -> UIImageView {
        let imgV = UIImageView(frame: rect)
        imgV.contentMode = .scaleAspectFill
        imgV.backgroundColor = .white
        imgV.clipsToBounds = true
        imgV.tag = tag
        
        let label = UILabel(frame: imgV.bounds)
        label.textAlignment = .center
        label.textColor = .orange
        label.text = title
        imgV.addSubview(label)
        view.addSubview(imgV)
        return imgV
    }
    
    //  由于子view没有处理点击事件, 所以被view捕获
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let point = touches.first?.location(in: nil) {
            switch (point.x, point.y) {
                //   区间运算符: ...闭区间, ..<半闭区间
            case (0...kWidth/2, 0...kHeight/2):
                loadImg()
                print("leftTop")
            case(kWidth/2...kWidth, 0...kHeight/2):
                downloadImg()
                print("rightTop")
            case(0...kWidth/2, kHeight/2...kHeight):
                bgDownloadImg()
                print("leftDown")
            case(kWidth/2...kWidth, kHeight/2...kHeight):
                showLoadProgress()
                print("rightDown")
            default:
                print("none")
            }
        }
    }
    
    

    /*swift3 GCD:
     使用Global Queue
     DispatchQueue.global().async{//子线程
     DispatchQueue.main.async {//主线程
     self.label?.text="finished"
     }
     }
     优先级：
     * DISPATCH_QUEUE_PRIORITY_HIGH:         .userInitiated
     * DISPATCH_QUEUE_PRIORITY_DEFAULT:      .default
     * DISPATCH_QUEUE_PRIORITY_LOW:          .utility
     * DISPATCH_QUEUE_PRIORITY_BACKGROUND:   .background
     DispatchQueue.global(qos: .userInitiated).async{
     }
     使用DispatchWorkItem
     let queue = DispatchQueue(label: "swift.queue")
     let workItem = DispatchWorkItem(qos: .userInitiated, flags: .assignCurrentContext) {
     }
     queue.async(execute: workItem)
     dispatch_time_t
     let delay = DispatchTime.now() + .seconds(60)
     DispatchQueue.main.after(when: delay) {
     }
     DispatchTime.now()获取当前时间
     */
    
    //  使用全局的session实例, 该实例没有代理对象, 无法检测下载速度, 也无法设置后台下载
    func loadImg() {
        if let url = URL(string: imgURL) {
            //  最基本的使用方式
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                //  data: 获取的数据, response: 回复, error: 错误
                print("默认读取完毕. 线程:\(Thread.current)")
                if (error != nil) {
                    print("there is an error!")
                    return
                }
                //  回到主线程
                DispatchQueue.main.async {
                    self.ivArr.first?.image = UIImage(data: data!)
                }
            }).resume()
        }
    }
    
    func downloadImg() {
        /*
         urlsession的task有三种
         1. dataTask, 普通的读取服务端数据操作
         2. downloadTask, 下载文件
         3. uploadTask, 上传文件
         */
        if let url = URL(string: imgURL) {
            URLSession.shared.downloadTask(with: url, completionHandler: { (location, response, error) in
                //  location: 下载好的文件位置(该文件临时缓存, 需要移动出来) response: 回复    error: 错误
                print("默认下载完毕: \(location?.path). 线程: \(Thread.current)")
                DispatchQueue.main.async {
                    do {
                        self.ivArr[1].image = try UIImage(data: Data(contentsOf: location!))
                    } catch let err as NSError {
                        print("打开文件失败: \(err.localizedFailureReason)")
                    }
                }
            }).resume()
        }
    }
    
    /* 自定义session:
     init(configuration:)
     init(configuration:delegate:delegateQueue:)
     都需要一个SessionCOnfiguration对象, 该对象有三种初始化方法:
     default: 该配置使用全局缓存, cookie等信息
     ephemeral: 不会对缓存或cookie一级认证信息进行存储, 相当于一个私有session
     background: 让网络操作在应用后台切换到后台后还能继续工作
     */
    func bgDownloadImg() {
        if let url = URL(string: imgURL) {
            /*
             URLSessionConfiguration可以进行很多配置, 比如timeoutIntervalForRequest, timeoutIntervalForResource控制网络超时的时间, 
             allowCellularAccess: 是否可以使用无线网络, HTTPAdditionalHeaders: 指定http请求头等
             */
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration)  //  download字符串作用: 当前任务的标识, 保证下载任务在后台运行
            session.downloadTask(with: url, completionHandler: { (location, response, error) in
                print("自定义下载完毕, 位置: \(location?.path), 线程: \(Thread.current)")
                DispatchQueue.main.async {
                    do {
                        self.ivArr[2].image = try UIImage(data: Data(contentsOf: location!))
                    } catch let err as NSError {
                        print("打开文件失败: \(err.localizedFailureReason)")
                    }
                }
            }).resume()
        }
    }
    
    //  使用代理, 上面的方法都是采用闭包的方式处理网络完成的情况, 如果需要监听网络操作过程中的事件需要使用代理
    /*
     sessionDelegate: 网络请求最基本的代理方法
     sessionTaskDelegate: 请求任务相关的代理方法
     sessionDownloadDelegate: 下载任务代理方法, 比如进度
     sessionDataDelegate: 普通数据和上传任务代理方法
     */
    //  监测下载进度
    func showLoadProgress() {
        if let url = URL(string: imgURL) {
            //  后台下载, 必须是代理的方式才可以后台下载
            let session = URLSession(configuration: .background(withIdentifier: "download"), delegate: self, delegateQueue: nil)
            session.downloadTask(with:url).resume()
        }
    }
    
    //  URLSessionDownloadDelegate
    //  下载完毕
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("代理下载完毕, 位置: \(location.path), thread: \(Thread.current)")
        DispatchQueue.main.async {
            do {
                self.ivArr[3].image = try UIImage(data: Data(contentsOf: location))
            } catch let err as NSError {
                print("打开文件失败: \(err.localizedFailureReason)")
            }
        }
    }
    
    //  下载
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        print("下载进度: \(totalBytesWritten)/\(totalBytesExpectedToWrite)")
    }
    
    //  重新下载
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        print("从\(fileOffset)处恢复下载, 一共\(expectedTotalBytes)")
    }
    
    
}

