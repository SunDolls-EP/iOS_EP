//
//  SocialView.swift
//  EaglePop
//
//  Created by 최시훈 on 2023/06/13.
//

import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit

class SocialView: UIViewController {
    let appleLoginButton = UIButton().then {
        $0.backgroundColor =  UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        $0.setImage( UIImage(named: "appleLogo"), for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 20
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .mainBackgroundColor
        
    }
    func setup() {
        [
            appleLoginButton
        ].forEach { self.view.addSubview($0) }

    }
    
}
