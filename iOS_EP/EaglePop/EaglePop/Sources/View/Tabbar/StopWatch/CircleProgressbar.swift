//
//  CircleProgressbar.swift
//  EaglePop
//
//  Created by 최시훈 on 2023/06/18.
//

import UIKit

class UICircleProgressbar: UIView {
    private let progressLayer = CAShapeLayer()

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupProgressLayer()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupProgressLayer()
        }

        func setupProgressLayer() {
//            let center = CGPoint(x: bounds.midX, y: bounds.midY)
//            let radius = min(bounds.width, bounds.height) / 2.0
//
//            let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)

//            progressLayer.path = circularPath.cgPath
            progressLayer.strokeColor = UIColor(red: 173/255, green: 173/255, blue: 173/255, alpha: 1).cgColor
            progressLayer.lineWidth = 10
            progressLayer.fillColor = UIColor(red: 255/255, green: 188/255, blue: 18/255, alpha: 1).cgColor
            progressLayer.strokeEnd = 0

            layer.addSublayer(progressLayer)
        }

        func setProgress(_ progress: CGFloat) {
            progressLayer.strokeEnd = progress
        }
}
