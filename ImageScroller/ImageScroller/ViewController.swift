//
//  ViewController.swift
//  ImageScroller
//
//  Created by apple on 2017/2/28.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kWidth = kRect.size.width
let kHeight = kRect.size.height

class ViewController: UIViewController {

    let scrollView = UIScrollView(frame: kRect)
    let imgView = UIImageView(image: #imageLiteral(resourceName: "Steve"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        setUpBG()
        setUpScrollView()
        setZoomScaleFor(scrollViewSize: scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        recenterImage()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setZoomScaleFor(scrollViewSize: scrollView.bounds.size)
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        recenterImage()
    }
    
    //  背景
    func setUpBG() {
        view.layer.contents = #imageLiteral(resourceName: "Steve").cgImage
        let visual = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        visual.frame = kRect
        view.addSubview(visual)
    }
    
    func setUpScrollView() {
        /*
         自动布局:
         flexibleLeftMargin     自动调整view与父视图左边距, 保证右边距不变
         flexibleWidth          自动调整view的宽度, 保证左边距和右边距不变
         flexibleRightMargin    自动调整view与父视图右边距, 以保证左边距不变
         flexibleTopMargin      自动调整view与父视图上边距, 以保证下边距不变
         flexibleHeight         自动调整view的高度, 以保证上边距和下边距不变
         flexibleBottomMargin   自动调整view与父视图下边距, 以保证上边距不变
         */
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = .clear
        scrollView.contentSize = imgView.bounds.size
        scrollView.delegate = self
        
        scrollView.addSubview(imgView)
        view.addSubview(scrollView)
    }
    
    //  设置缩放
    func setZoomScaleFor(scrollViewSize: CGSize) {
        let imageSize = imgView.bounds.size
        let widthScale = scrollViewSize.width/imageSize.width
        let heightScale = scrollViewSize.height/imageSize.height
        let minimunScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minimunScale
        scrollView.maximumZoomScale = 3.5
    }
    
    //  重新定位image
    func recenterImage() {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imgView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width)/2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width)/2.0 : 0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UIScrollViewDelegate {
    //  要缩放时调用, 返回需要缩放的view
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgView
    }
    //  缩放后调用
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        recenterImage()
    }
}

