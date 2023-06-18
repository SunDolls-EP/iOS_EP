//
//  Signin.swift
//  EaglePop
//
//  Created by 최시훈 on 2023/05/17.
//

import UIKit
import RxSwift
import RxCocoa
import Then
import GoogleSignIn
import SnapKit


class SigninView: UIViewController {
    
    let logoImage = UIImageView().then {
        $0.image = UIImage(named: "logo")
        $0.contentMode = .scaleAspectFit
    }
    let wiseSayingLabel = UILabel().then {
        $0.text = "오늘 걷지 않으면 내일은 뛰어야 된다."
        $0.font = UIFont(name: "GangwonEduSaeeum-OTFMedium", size: 25)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
//    let googleLoginButton = GIDSignInButton().then {
//        $0.backgroundColor = .clear
//        $0.layer.cornerRadius = 20
//        $0.addTarget(self, action: #selector(didTabGoogleLoginButton), for: .touchUpInside)
//    }
        let googleLoginButton = UIButton().then {
            $0.backgroundColor =  UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            $0.setImage( UIImage(named: "googleLogo"), for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 20

        }
    let appleLoginButton = UIButton().then {
        $0.backgroundColor =  UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        $0.setImage( UIImage(named: "appleLogo"), for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 20
    }
    // MARK: - Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackgroundColor
        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bind()
        
    }
    // MARK: - bindAction
    var disposeBag = DisposeBag()

    func bind() {

        googleLoginButton.rx.tap
            .subscribe(onNext: {
                let tabBarController = TabBarController()
                tabBarController.modalPresentationStyle = .fullScreen
                self.present(tabBarController, animated: true)
            },
                       onError: { error in
                print("onError")
            },
                       onCompleted: {
                print("endEvent")
            })
               .disposed(by: disposeBag)
        appleLoginButton.rx.tap
            .subscribe(onNext: {
                let tabBarController = TabBarController()
                tabBarController.modalPresentationStyle = .fullScreen
                self.present(tabBarController, animated: true)
            },
                       onError: { error in
                print("onError")
            },
                       onCompleted: {
                print("endEvent")
            })
            .disposed(by: disposeBag)
    }
    // MARK: - setupUI
    func setup() {
        [
            logoImage,
            wiseSayingLabel,
            googleLoginButton,
            appleLoginButton
        ].forEach { self.view.addSubview($0) }
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(140)
            $0.bottom.equalTo(logoImage.snp.top).offset(170)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
        }
        wiseSayingLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(0)
            $0.bottom.equalTo(wiseSayingLabel.snp.top).offset(60)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().offset(-30)
        }
        googleLoginButton.snp.makeConstraints {
            $0.top.equalTo(googleLoginButton.snp.bottom).offset(-50)
            $0.bottom.equalToSuperview().offset(-200)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        appleLoginButton.snp.makeConstraints {
            $0.top.equalTo(googleLoginButton.snp.bottom).offset(10)
            $0.bottom.equalTo(appleLoginButton.snp.top).offset(50)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
    }
    //MARK: - alertManager
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

