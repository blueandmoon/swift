//
//  CollectionModel.swift
//  PictureBrowser_05
//
//  Created by apple on 2017/2/28.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

class CollectionModel: NSObject {
    
    
    var title:String?
    var descriptions:String?
    var featureImg:UIImage?
    
    init(title: String, descriptions: String, featureImg: UIImage) {
        self.title = title
        self.descriptions = descriptions
        self.featureImg = featureImg
    }
    
    static func createInterests() -> [CollectionModel] {
        return [
            CollectionModel(title: "Hello there, i miss u.", descriptions: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featureImg: UIImage(named: "hello")!),
            CollectionModel(title: "🐳🐳🐳🐳🐳", descriptions: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featureImg: UIImage(named: "dudu")!),
            CollectionModel(title: "Training like this, #bodyline", descriptions: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featureImg: UIImage(named: "bodyline")!),
            CollectionModel(title: "I'm hungry, indeed.", descriptions: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featureImg: UIImage(named: "wave")!),
            CollectionModel(title: "Dark Varder, #emoji", descriptions: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featureImg: UIImage(named: "darkvarder")!),
            CollectionModel(title: "I have no idea, bitch", descriptions: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featureImg: UIImage(named: "hhhhh")!),
        ]
    }
    
    
    
    
    
    

}
