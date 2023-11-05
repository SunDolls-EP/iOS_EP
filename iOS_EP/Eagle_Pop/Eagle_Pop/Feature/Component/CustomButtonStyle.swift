//
//  CustomButtonStyle.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/16/23.
//

import SwiftUI
import ComposableArchitecture

struct CustomButtonStyle: ButtonStyle {
    let signinButtonHeight = SigninView(store: Store(initialState: SigninCore.State()) {
        SigninCore()}).signinButtonHeight
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: signinButtonHeight / 2)
                    .stroke(Color(red: 0.8, green: 0.8, blue: 0.8), lineWidth: 1.03)
                )
        
            .background(Color.white)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .cornerRadius(signinButtonHeight/2)
    }
}
