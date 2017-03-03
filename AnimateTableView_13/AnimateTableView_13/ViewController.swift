//
//  ViewController.swift
//  AnimateTableView_13
//
//  Created by apple on 2017/3/3.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit

let kRect = UIScreen.main.bounds
let kWidth = kRect.size.width
let kHeight = kRect.size.height

class ViewController: UIViewController {

    let dataArr = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"]
    let tableView = UITableView(frame: kRect, style: .plain)
    let ReuseIdentifier = "customCell"
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTabe()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: ReuseIdentifier)
        view.addSubview(tableView)
    }
    
    func animateTabe() {
        tableView.reloadData()
        //  所有可见的cell
        let cells = tableView.visibleCells
        let tableHeight = tableView.bounds.size.height
        
        for (index, cell) in cells.enumerated() {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            UIView.animate(withDuration: 1.0, delay: (0.05 * Double(index)), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: { 
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
        }
        
    }
    
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = dataArr.count - 1
        let color = (CGFloat(index)/CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.5, alpha: 1.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier, for: indexPath)
        cell.textLabel?.text = dataArr[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.textLabel?.backgroundColor = .clear
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = .gray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorForIndex(index: indexPath.row)
    }
}

