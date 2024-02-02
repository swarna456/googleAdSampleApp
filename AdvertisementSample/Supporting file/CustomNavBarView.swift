//
//  CustomNavBarView.swift
//  AdvertisementSample
//
//  Created by Karthik.Kurdekar on 02/02/24.
//

import SwiftUI

struct CustomNavBarView<LeftView, CenterView, RightView>: View where LeftView: View, CenterView: View, RightView: View {
    let leftView: () -> LeftView?
    let centerView: () -> CenterView?
    let rightView: () -> RightView?
    
    init(@ViewBuilder leftView: @escaping () -> LeftView? = { FixedSpacer() }, @ViewBuilder centerView: @escaping () -> CenterView = { FixedSpacer() }, @ViewBuilder rightView: @escaping () -> RightView = { FixedSpacer() }) {
        self.leftView = leftView
        self.rightView = rightView
        self.centerView = centerView
    }
    
    var body: some View {
        HStack(alignment: .center) {
            FixedSpacer(width: 5)
            if leftView() is FixedSpacer {
                leftView()!
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                // Fix for category detail screen.
                // check for rightView is nil or not and based on that setting the frame.
                if rightView() is FixedSpacer {
                    leftView()
                    // Setting the maxwidth 44 if rightView is nil.
                        .frame(maxWidth: 44, alignment: .leading)
                } else {
                    leftView()
                        .frame(alignment: .leading)
                }
            }
            FixedSpacer(width: 10)
            if centerView() is FixedSpacer {
                centerView()!
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                centerView()
                    .frame(maxWidth: .infinity, alignment: .center)
                   
            }
            FixedSpacer(width: 10)
            if rightView() is FixedSpacer {
                rightView()!
                // Setting the maxwidth 44 if rightView is nil.
                    .frame(maxWidth: 44, alignment: .trailing)
            } else {
                rightView()
                    .frame(alignment: .trailing)
            }
            FixedSpacer(width: 10)
        }
        .frame(height: 44)
    }
}
