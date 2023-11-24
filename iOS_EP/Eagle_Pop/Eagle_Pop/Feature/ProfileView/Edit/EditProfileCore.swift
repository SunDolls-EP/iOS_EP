//
//  EditProfileCore.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/29/23.
//

import Foundation
import ComposableArchitecture
import Alamofire
import SwiftUI


struct EditProfileCore: Reducer {
    @Dependency(\.sideEffect.editProfile) var sideEffect

    var imageURL = SigninCore.SigninState().profileUrl
    struct EditProfileState: Equatable {
        var name: String = ""
        var email: String = ""
        var school: String = ""
        var image = Image(systemName: "person.fill")
    }
    
    enum EditProfileAction: Equatable {
        
        case saveModifiedInfo
        case getImage
        case back
        
    }
    
    func reduce(into state: inout EditProfileState, action: EditProfileAction) -> Effect<EditProfileAction> {
        var state = state
        switch action {
        case .saveModifiedInfo:
            let parameters: [String: Any] = [
                "username": "\(state.name)",
                "schoolName": "\(state.school)"
            ]
            AF.request("\(api)/api/user", method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: HTTPHeaders(["Authorization": "\(Token.get(.accessToken)!)"]))
                .validate()
                .response() { response in
                    switch response.result {
                    case .success:
                        if let data = response.data {
                            let decoder = JSONDecoder()
                            if let decodedData = try? decoder.decode(EditProfile.self, from: data) {
                                print(decodedData)
                            }
                        }
                    case .failure(let error):
                        print("토큰이 만료되었습니다 앱을 다시 실행해주세요.")
                    }
                }
            return .none
        case .getImage:
            AF.request(imageURL).responseData { response in
                switch response.result {
                case .success(let imageData):
                    if let uiImage = UIImage(data: imageData) {
                        state.image = Image(uiImage: uiImage)
                    } else {
                        print("Failed to convert data to image")
                    }
                case .failure(let error):
                    // 이미지 다운로드 실패
                    print("Error downloading image: \(error)")
                }
            }
            return .none
        case .back:
            sideEffect.routeToBack()
            return .none
            
        }
    }
}
