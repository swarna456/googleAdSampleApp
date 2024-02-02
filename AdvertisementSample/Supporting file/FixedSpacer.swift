//
//  FixedSpacer.swift
//  AdvertisementSample
//
//  Created by Karthik.Kurdekar on 02/02/24.
//

import SwiftUI

struct FixedSpacer: View {
    var width: CGFloat?
    var height: CGFloat?
    var body: some View {
        if width != nil, height != nil {
            Spacer().frame(width: width, height: height)
        } else if height != nil, width == nil {
            Spacer().frame(height: height)
        } else if width != nil, height == nil {
            Spacer().frame(width: width)
        } else {
            Spacer()
        }
    }
}
