//
//  ViewController.swift
//  WelcomView_04
//
//  Created by apple on 2017/2/27.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kHeight = kRect.size.height
let kWidth = kRect.size.width

class ViewController: UIViewController, UIScrollViewDelegate {

    let scrollV = UIScrollView(frame: kRect)
    let imgArr = [#imageLiteral(resourceName: "first"), #imageLiteral(resourceName: "second"), #imageLiteral(resourceName: "three")]
    let pageControl = UIPageControl(frame: CGRect(x: 0, y: kHeight - 30, width: kWidth, height: 20))
    var curPage = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        setUpView()
        
    }
    
    func setUpView() {
        //  遍历数组, 同事获得index
        for (index, value) in imgArr.enumerated() {
            let iv = UIImageView(frame: CGRect(x: kWidth * CGFloat(index), y: 0, width: kWidth, height: kHeight))
            iv.image = value
            //  限制边界
            iv.clipsToBounds = true
            iv.contentMode = .scaleToFill
            scrollV.addSubview(iv)
        }
        scrollV.delegate = self
        scrollV.isPagingEnabled = true
        scrollV.contentSize = CGSize(width: kWidth * CGFloat(imgArr.count), height: kHeight)
        
        pageControl.currentPage = curPage
        pageControl.numberOfPages = imgArr.count
        pageControl.isEnabled = false
        pageControl.pageIndicatorTintColor = .purple
        
        view.addSubview(scrollV)
        view.addSubview(pageControl)
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let number = Int(round(scrollV.contentOffset.x/kWidth))
        //  由于swift是类型安全的, 所以通过逻辑比较时, 需要两边的类型相同, 不同需要转换一下类型
        if number >= 0 && number != curPage {
            curPage = number
            pageControl.currentPage = curPage
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

