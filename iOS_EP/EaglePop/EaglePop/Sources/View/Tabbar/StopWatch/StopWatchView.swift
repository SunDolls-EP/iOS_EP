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
    let stopWatchView = UIView().then {
        $0.backgroundColor = .red
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackgroundColor
        setup()
        
    }
}
extension StopWatchView {
    
    func setup() {
        [
            stopWatchView
        ].forEach { self.view.addSubview($0) }
        stopWatchView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.left.equalToSuperview().offset(61)
            $0.right.equalToSuperview().offset(-61)
            $0.bottom.equalTo(stopWatchView.snp.top).offset(270)
        }
        
    }
}
