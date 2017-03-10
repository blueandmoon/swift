//
//  CustomCell.swift
//  AnimateCollectionView_24
//
//  Created by apple on 2017/3/10.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let ItemWidth = kWidth-20
let ItemHeight = kHeight/3-20


let imgRect = CGRect(x: 0, y: 0, width: ItemWidth, height: ItemHeight)
let textRect = CGRect(x: 0, y: ItemHeight-40, width: ItemWidth, height: 40)

class CustomCell: UICollectionViewCell {
    
    let imgV = UIImageView(frame: imgRect)
    let textV = UITextView(frame: textRect)
    let backBtn = UIButton(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
    
    //  定义一个无参数, 无返回值的闭包属性, 用于处理button被点击的情况
    var backTapped: (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        imgV.contentMode = .center
        imgV.clipsToBounds = true
        textV.font = UIFont.systemFont(ofSize: 14)
        textV.isUserInteractionEnabled = false
        backBtn.setImage(#imageLiteral(resourceName: "Back-icon"), for: .normal)
        backBtn.isHidden = true
        backBtn.addTarget(self, action: #selector(backBtnTouch), for: .touchUpInside)
        backgroundColor = .gray
        
        addSubview(imgV)
        addSubview(textV)
        addSubview(backBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func backBtnTouch() {
        backBtn.isHidden = true
        backTapped!()
    }
    
    func handleCellSelected() {
        backBtn.isHidden = false
        superview?.bringSubview(toFront: self)
    }
    
    func prepareCell(model: CellModel) {
        imgV.frame = imgRect
        textV.frame = textRect
        imgV.image = UIImage(named: model.imgName)
        textV.text = model.title
    }
    
    
}
