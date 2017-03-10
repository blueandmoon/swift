//
//  ViewController.swift
//  AnimateCollectionView_24
//
//  Created by apple on 2017/3/10.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kWidth = kRect.size.width
let kHeight = kRect.size.height

class ViewController: UIViewController {

    var cv:UICollectionView!
    var dataArr = CellModel.getData()
    let reuseIdentifier = String(describing: CustomCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpView() {
        let cLayout = UICollectionViewFlowLayout()
        cLayout.scrollDirection = .vertical
        cLayout.itemSize = CGSize(width: ItemWidth, height: ItemHeight)
        cLayout.minimumLineSpacing = 10
        cLayout.minimumInteritemSpacing = 10
        cLayout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        cv = UICollectionView(frame: kRect, collectionViewLayout: cLayout)
        cv.backgroundColor = .orange
        cv.dataSource = self
        cv.delegate = self
        cv.register(CustomCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        view.addSubview(cv)
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dataArr?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCell
        cell.prepareCell(model: (dataArr?[indexPath.row])!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !collectionView.isScrollEnabled {
            return
        }
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCell else {
            return
        }
        
        cv.isScrollEnabled = false
        cell.handleCellSelected()
        cell.backTapped = {
            print("闭包执行")
            collectionView.isScrollEnabled = true
            collectionView.reloadItems(at: [indexPath])
        }
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: { 
            cell.frame = CGRect(x: 10, y: self.cv.contentOffset.y, width: kWidth-20, height: kHeight)
            cell.imgV.frame = cell.bounds
            cell.textV.frame = CGRect(x: 0, y: kHeight-60, width: kWidth-20, height: 60)
        }) { (finishe) in
            print("动画结束")
        }
        
    }
}

struct CellModel {
    let imgName: String
    let title: String
    
    init(imgName: String?, title: String?) {
        self.imgName = imgName ?? ""
        self.title = title ?? "没有title"
    }
    
    static func getData() -> [CellModel]? {
        let txt = "Your vote is your official choice on some specific question. You might feel that your vote hardly counts in a Presidential election, though your vote for student council treasure might feel like it has a lot more importance."
        let imgArr = ["one", "two", "three", "four", "five"]
        let titleArr = Array(repeatElement(txt, count: 5))
        var result = [CellModel]()
        for (index, name) in imgArr.enumerated() {
            result.append(CellModel(imgName: name, title: titleArr[index]))
            
        }
        return result
    }
    
}
