//
//  AdBannerView.swift
//  AdvertisementSample
//
//  Created by Karthik.Kurdekar on 02/02/24.
//

import UIKit
import SwiftUI
import GoogleMobileAds

struct AdBannerView: UIViewControllerRepresentable {
    var bannerID: String
    var adWidth: CGFloat
    var adHeight: CGFloat

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    func makeUIViewController(context: Context) -> UIViewController {
        print("makeUIViewController called")
        let bannerView = GADBannerView(frame: CGRect(x: 0, y: 0, width: adWidth, height: adHeight))
        let viewController = UIViewController()
        bannerView.adUnitID = bannerID
        bannerView.rootViewController = viewController
        viewController.view.addSubview(bannerView)
        bannerView.load(GADRequest())
        bannerView.delegate = context.coordinator
        return viewController
    }
    
    @available(iOS 16.0, *)
    func sizeThatFits(_ proposal: ProposedViewSize, uiViewController: UIViewController, context: Context) -> CGSize? {
        CGSize(width: adWidth, height: adHeight)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        print("updateUIViewController called")
    }
    
    class Coordinator : NSObject, GADBannerViewDelegate {
        var parent : AdBannerView
        init(_ parent : AdBannerView) { self.parent = parent }
        
        public func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
            print("Ads received successfully")
        }
        
        public func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
            print("Ad loads to fail: \(error.localizedDescription)")
        }
    }
}

