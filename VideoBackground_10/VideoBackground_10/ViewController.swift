//
//  ViewController.swift
//  VideoBackground_10
//
//  Created by apple on 2017/3/1.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

let kRect = UIScreen.main.bounds
let kWidth  = kRect.size.width
let kHeight = kRect.size.height

let loginBtnRect = CGRect(x: 30, y: kHeight - 150.0, width: kWidth - 60, height: 50)
let rigisBtnRect = CGRect(x: 30, y: kHeight - 75, width: kWidth - 60, height: 50)

class ViewController: UIViewController,AVPlayerViewControllerDelegate  {

    let playerVC = AVPlayerViewController()
    let loginBtn = UIButton(frame: loginBtnRect)
    let registerBtn = UIButton(frame: rigisBtnRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setMoviePlayer()
    }
    
    func setMoviePlayer() {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        playerVC.player = AVPlayer(url: url)    //  播放源
        playerVC.showsPlaybackControls = false  //  是否显示播放源
        playerVC.videoGravity = AVLayerVideoGravityResizeAspectFill //  视频界面适应方式
        playerVC.view.frame = kRect
        playerVC.view.alpha = 0
        //  监听试音播放通知
        NotificationCenter.default.addObserver(self, selector: #selector(repeatPlay), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerVC.player?.currentItem)
        view.addSubview(playerVC.view)
        view.sendSubview(toBack: playerVC.view) //  放到最底层
        UIView.animate(withDuration: 1) { 
            self.playerVC.view.alpha = 1
            self.playerVC.player?.play()
        }
    }
    
    //  回到起点, 重新播放
    func repeatPlay() {
        playerVC.player?.seek(to: kCMTimeZero)
        playerVC.player?.play()
    }
    
    func setUpView() {
        view.backgroundColor = .white
        
        loginBtn.customBtn(customTitle: "登录")
        registerBtn.customBtn(customTitle: "注册")
        
        loginBtn.addTarget(self, action: #selector(buttonTap(_:)), for: .touchUpInside)
        registerBtn.addTarget(self, action: #selector(buttonTap(_:)), for: .touchUpInside)
        
        view.addSubview(loginBtn)
        view.addSubview(registerBtn)
    }
    
    func buttonTap(_ sender: UIButton) {
        print("点击按钮: " + sender.currentTitle!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIButton {
    func customBtn(customTitle title: String) {
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
    }
}

