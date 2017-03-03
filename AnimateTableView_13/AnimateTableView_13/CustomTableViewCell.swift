//
//  CustomTableViewCell.swift
//  AnimateTableView_13
//
//  Created by apple on 2017/3/3.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        gradientLayer.frame = self.bounds
        let color1 = UIColor(white: 1.0, alpha: 0.2).cgColor
        let color2 = UIColor(white: 1.0, alpha: 0.1).cgColor
        let color3 = UIColor.clear.cgColor
        let color4 = UIColor(white: 0.0, alpha: 0.05).cgColor
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.04, 0.95, 0]
        layer.insertSublayer(gradientLayer, at: 0)
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
