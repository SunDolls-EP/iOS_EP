//
//  CircleProgressBar.swift
//  EaglePop
//
//  Created by 최시훈 on 2023/06/18.
//

import UIKit

class CircleProgressBar: UIView {
    var progress: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = min(rect.width, rect.height) / 2 - lineWidth / 2
        let startAngle: CGFloat = -.pi / 2
        let endAngle = startAngle + (2 * .pi * progress)

        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        path.lineWidth = lineWidth
        path.lineCapStyle = .round
        path.stroke()
    }
    
    private let lineWidth: CGFloat = 10.0
}
