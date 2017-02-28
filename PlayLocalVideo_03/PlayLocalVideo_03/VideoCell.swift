//
//  VideoCell.swift
//  PlayLocalVideo_03
//
//  Created by apple on 2017/2/27.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

struct VideoModel {
    let image: String
    let title: String
    let source: String
}

class VideoCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let videoImage = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight/3))
    let videoTitle = UILabel(frame: CGRect(x: 0, y: 0, width: kScreenHeight/3 - 50, height: 30))
    let videoSource = UILabel(frame: CGRect(x: 0, y: kScreenHeight/3 - 20, width: kScreenWidth, height: 20))
    
    /*
     Public: 所有都可以访问
     Internal: 自己framework访问(默认)
     Private:私有
     总的来说, 默认就行, 不公开就private, 写框架的话, 就需要public公开接口
     */
    
    private let videoPlay = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight/3))
    
    func setUpView() {
        videoImage.contentMode = .scaleToFill
        videoPlay.contentMode = .center
        videoPlay.image = UIImage(named: "playBtn")
        videoTitle.textColor = .white
        videoTitle.font = UIFont(name: "Zapfino", size: 14)
        videoTitle.textAlignment = .center
        videoSource.textColor = .gray
        videoSource.font = UIFont(name: "Avenir Next", size: 14)
        videoSource.textAlignment = .center
        self.contentView.addSubview(videoImage)
        contentView.addSubview(videoPlay)
        contentView.addSubview(videoTitle)
        contentView.addSubview(videoSource)
    }
    
    func setModel(model: VideoModel) {
        videoImage.image = UIImage(named: model.image)
        videoTitle.text = model.title
        videoSource.text = model.source
    }
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
