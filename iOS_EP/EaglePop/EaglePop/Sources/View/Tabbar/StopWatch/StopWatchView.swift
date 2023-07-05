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
import KDCircularProgress

class StopWatchView: UIViewController {
    var timer: Timer?
    var counter: TimeInterval = 60.0
    
    let minutes = Array(0...59)
    let seconds = Array(0...59)
    
    let pickerView = UIPickerView().then {
        $0.isHidden = true
    }
    
    let circleProgress = KDCircularProgress().then {
        $0.startAngle = -90
        $0.progressThickness = 0.2
        $0.trackThickness = 0.2
        $0.clockwise = true
        $0.gradientRotateSpeed = 2
        $0.roundedCorners = true
        $0.glowMode = .noGlow
        $0.glowAmount = 0.9
        $0.trackColor = UIColor(red: 173/255, green: 173/255, blue: 173/255, alpha: 1)
        $0.set(colors: UIColor(red: 255/255, green: 118/255, blue: 18/255, alpha: 1))
    }
    let stopWatchView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 150
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackgroundColor
        setup()
        startTimer()
    }
}
extension StopWatchView: UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: - UIPickerViewDataSource

        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 2 // 분과 초 두 개의 컴포넌트를 가지고 있습니다.
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if component == 0 {
                return minutes.count
            } else {
                return seconds.count
            }
        }

        // MARK: - UIPickerViewDelegate

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if component == 0 {
                return String(minutes[row])
            } else {
                return String(seconds[row])
            }
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let selectedMinutes = minutes[pickerView.selectedRow(inComponent: 0)]
            let selectedSeconds = seconds[pickerView.selectedRow(inComponent: 1)]
        }
    
}
extension StopWatchView {
    @objc func updateProgress() {
        counter -= 0.1
        let progress = 1.0 - (counter / 60.0)
        circleProgress.animate(toAngle: 360 * progress, duration: 0.1, completion: nil)
        
        
    }
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        }
    }
}
extension StopWatchView {
    func setup() {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        [
            stopWatchView,
            circleProgress,
            pickerView
        ].forEach { self.view.addSubview($0) }
        stopWatchView.snp.makeConstraints {
            $0.top.left.equalTo(circleProgress).offset(27.3)
            $0.right.bottom.equalTo(circleProgress).offset(-27.3)
        }
        circleProgress.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(150)
            $0.width.equalTo(300)
            $0.height.equalTo(300)
        }
        pickerView.snp.makeConstraints {
            $0.top.equalTo(circleProgress.snp.top).offset(60)
            $0.bottom.equalTo(circleProgress.snp.bottom).offset(-60)
            $0.left.equalTo(circleProgress.snp.left).offset(50)
            $0.right.equalTo(circleProgress.snp.right).offset(-50)
        }
    }
}
