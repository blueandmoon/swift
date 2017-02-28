//
//  ViewController.swift
//  PictureBrowser_05
//
//  Created by apple on 2017/2/27.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kHeight = kRect.size.height
let kWidth = kRect.size.width

let ItemWidth = kWidth - 40.0
let ItemHeight = kHeight/3.0

class ViewController: UIViewController {


    let bgIV = UIImageView(frame: kRect)
    var collectionView: UICollectionView!
    let data = CollectionModel.createInterests()
    let reuseIdentifier = "CollectionCell"
    
    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        setUpView()
    }
    
    func setUpView() {
        bgIV.image = #imageLiteral(resourceName: "blue")
        
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.itemSize = CGSize(width: ItemWidth, height: ItemHeight)
        collectionLayout.minimumLineSpacing = 20
        collectionLayout.minimumInteritemSpacing = 20
        collectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView = UICollectionView(frame: CGRect(x: 0, y: (kHeight - ItemHeight)/2, width: kWidth, height: ItemHeight), collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        visualEffectView.frame = kRect
        
        view.addSubview(bgIV)
        view.addSubview(visualEffectView)
        view.addSubview(collectionView)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//  扩展ViewController支持协议
extension ViewController:UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionCell
        
        cell.data = self.data[indexPath.row]
        
        return cell
    }
}
