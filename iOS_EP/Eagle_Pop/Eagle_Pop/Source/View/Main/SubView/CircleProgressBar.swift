//
//  CircleProgressBar.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/29.
//

import SwiftUI

struct CircleProgressView: View {
    
    let percentage: CGFloat
    var body: some View {

        ZStack {
            Circle()
                .stroke(lineWidth: 3)
                .opacity(0.3)
                .foregroundColor(.gray)
            Circle()
                .trim(from: 0.0, to: percentage)
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.blue)
                .rotationEffect(Angle(degrees: -90))
        }
    }
}

