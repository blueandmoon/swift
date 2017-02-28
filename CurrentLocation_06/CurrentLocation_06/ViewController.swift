//
//  ViewController.swift
//  CurrentLocation_06
//
//  Created by apple on 2017/2/28.
//  Copyright © 2017年 ligen. All rights reserved.
//

import UIKit
import CoreLocation
/*
 使用定位的步骤:
 1. general -> Linked Frameworks and Libraries 导入CoreLocation.framework框架
 2. import CoreLocation
 3. 使用
 
 */

let kRect = UIScreen.main.bounds
let kHeight = kRect.size.height
let kWidth = kRect.size.width

class ViewController: UIViewController, CLLocationManagerDelegate {

    let button = UIButton(frame: CGRect(x: 0, y: 500, width: kWidth, height: 50))
    let label = UILabel(frame: CGRect(x: 0, y: 100, width: kWidth, height: 50))
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   //  精确度
        locationManager.requestAlwaysAuthorization()    //  发送开启定位的请求
        
        setUpView()
        
        
    }
    
    func setUpView() {
        //  将图片用作当前view的背景
        view.layer.contents = #imageLiteral(resourceName: "bg").cgImage
        
        //  添加毛玻璃效果
        let visualView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualView.frame = kRect
        
        label.text = "未定位"
        label.textColor = .white
        label.textAlignment = .center
        button.setTitle("开始定位", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "Find my location"), for: .normal)
        button.addTarget(self, action: #selector(findLocation), for: .touchUpInside)
        
        view.addSubview(visualView)
        view.addSubview(label)
        view.addSubview(button)
    }
    
    func findLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    //  定位失败
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        label.text = "ERROR: " + error.localizedDescription
    }
    
    //  定位成功
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let newLocal = locations.first {
            CLGeocoder().reverseGeocodeLocation(newLocal, completionHandler: { (pms, err) in
                if (pms?.last?.location?.coordinate) != nil {
                    manager.stopUpdatingLocation()  //  停止定位
                    
                    //  取得第一个地标, 地标中存储了详细的地址信息, 注意, 一个地名肯搜索出多个地址
                    let placemark:CLPlacemark = (pms?.last)!
                    print(placemark)
                    let name: String? = placemark.name  //  地名
                    let thoroughfare:String? = placemark.thoroughfare    //  街道
                    let subThoroughfare: String? = placemark.subThoroughfare    //  
                    let localcity: String? = placemark.locality  //  城市
                    //别的含义
                    //let location = placemark.location;//位置
                    //let region = placemark.region;//区域
                    //let addressDic = placemark.addressDictionary;//详细地址信息字典,包含以下部分信息
                    //let subLocality=placemark.subLocality; // 城市相关信息，例如标志性建筑
                    //let administrativeArea=placemark.administrativeArea; // 州
                    //let subAdministrativeArea=placemark.subAdministrativeArea; //其他行政区域信息
                    //let postalCode=placemark.postalCode; //邮编
                    //let ISOcountryCode=placemark.ISOcountryCode; //国家编码
                    //let country=placemark.country; //国家
                    //let inlandWater=placemark.inlandWater; //水源、湖泊
                    //let ocean=placemark.ocean; // 海洋
                    //let areasOfInterest=placemark.areasOfInterest; //关联的或利益相关的地标
                    
                    self.label.text = String(name ?? "-") + String(thoroughfare ?? "-") + String(subThoroughfare ?? "-") + String(localcity ?? "-")
                }
            })
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

