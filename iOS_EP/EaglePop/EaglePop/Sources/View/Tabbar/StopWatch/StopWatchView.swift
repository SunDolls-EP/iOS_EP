//
//  StopWatchView.swift
//  EaglePop
//
//  Created by 최시훈 on 2023/06/13.
//

import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit

class StopWatchView: UIViewController {
    let circleProgressBar = UICircleProgressbar()
    let stopWatchView = UIView().then {
        $0.backgroundColor = UIColor(red: 47/255, green: 47/255, blue: 47/255, alpha: 1)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackgroundColor
        setup()
        setupCircleProgressBar()
        
    }
}
extension StopWatchView {
    
    func setup() {
        
        stopWatchView.addSubview(circleProgressBar)
        circleProgressBar

        [
            stopWatchView,
            circleProgressBar
        ].forEach { self.view.addSubview($0) }
        stopWatchView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.left.equalToSuperview().offset(61)
            $0.right.equalToSuperview().offset(-61)
            $0.bottom.equalTo(stopWatchView.snp.top).offset(270)
        }
        circleProgressBar.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(stopWatchView).offset(0)
        }
        
    }
    func setupCircleProgressBar() {
        circleProgressBar.setProgress(1)
    }
}
