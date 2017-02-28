//
//  CollectionCell.swift
//  PictureBrowser_05
//
//  Created by apple on 2017/2/28.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    let featureImgV = UIImageView(frame: CGRect(x: 0, y: 0, width: ItemWidth, height: ItemHeight))
    let interestTitleL = UILabel(frame: CGRect(x: 0, y: ItemHeight - 50.0, width: ItemWidth, height: 20))
    let interestDetailL = UILabel(frame: CGRect(x: 0, y: ItemHeight - 30, width: ItemWidth, height: 30))
    var data: CollectionModel? {
        /*
         属性观察器
         willSet 在新的值被设置之前调用
         didSet 在新的值设置之后调用
         */
        didSet {
            updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        interestTitleL.backgroundColor = .gray
        interestTitleL.textColor = .white
        interestTitleL.textAlignment = .center
        interestTitleL.font = UIFont.systemFont(ofSize: 16, weight: 4)
        interestDetailL.backgroundColor = .gray
        interestDetailL.textColor = .white
        interestDetailL.textAlignment = .center
        interestDetailL.numberOfLines = 0
        interestDetailL.font = UIFont.systemFont(ofSize: 10)
        contentView.addSubview(featureImgV)
        contentView.addSubview(interestTitleL)
        contentView.addSubview(interestDetailL)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI() {
        featureImgV.image = data?.featureImg
        interestTitleL.text = data?.title
        interestDetailL.text = data?.descriptions
    }
    
    
    
}
