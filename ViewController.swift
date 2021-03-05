//
//  ViewController.swift
//  CFiAdmobIntSwiftSample
//
//  Created by Eric Chen on 2021/3/5.
//

import UIKit
import GoogleMobileAds
class ViewController: UIViewController {

    var interstitial:GADInterstitial!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        interstitial = GADInterstitial.init(adUnitID: "ca-app-pub-7236340530869760/1865580168")
        interstitial.delegate = self
        let req = GADRequest()
//        req.testDevices = ["14c30346989d0fac6da79e0c7d580cd7"]
        
        interstitial.load(req)
        
    }

}

extension ViewController:GADInterstitialDelegate{
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        interstitial.present(fromRootViewController: self)
        print("Interstitial adapter class name: " ,ad.responseInfo?.adNetworkClassName ?? "");//Check the value of adNetworkClassName
    }
}

