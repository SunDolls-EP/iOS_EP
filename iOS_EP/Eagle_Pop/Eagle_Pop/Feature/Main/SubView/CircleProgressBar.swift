//
//  CircleProgressBar.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/29.
//

import SwiftUI

struct CircleProgressView: View {
    
    let percentage: CGFloat
    let size: CGFloat = 16
    
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
            Circle()
                .fill(Color.white)
                .frame(width: size, height: size)
                .overlay(Circle().strokeBorder(Color.accentColor, lineWidth: 2))
                .padding(.top, -(size/2))
                .frame(maxHeight: .infinity, alignment: .top)
                .rotationEffect(Angle(degrees: percentage * 360))
        }
    }
}

