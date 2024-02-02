//
//  ContentView.swift
//  AdvertisementSample
//
//  Created by Karthik.Kurdekar on 02/02/24.
//

import SwiftUI

struct ContentView: View {
    
    let bannerId = "ca-app-pub-3940256099942544/2934735716"
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 0) {
                navBar()
                    .background(Color.blue)
                List(0..<10) { _ in
                    HStack {
                        FixedSpacer()
                        AdBannerView(bannerID: bannerId, adWidth: 320, adHeight: 50)
                        FixedSpacer()
                    }
                    Text("Hello world!")
                }
                .listStyle(.plain)
                FixedSpacer()
            }
        }
    }
    
    @ViewBuilder
    private func navBar() -> some View {
        CustomNavBarView(leftView: {
            Text("")
        }, centerView: {
            Text("Navigation Title")
                .foregroundColor(Color.white)
                .font(.system(size: 18))
        }, rightView: {
            Text("")
        })
        .padding(EdgeInsets(top: 6, leading: 8, bottom: 6, trailing: 8))
    }
}
