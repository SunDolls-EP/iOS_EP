//
//  Token.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/18/23.
//

import Foundation


enum TokenType {
    case grantType
    case accessToken
    case refreshToken
}
class Token {
    static func save(_ tokenType: TokenType, _ value: String) {
        UserDefaults.standard.set(value, forKey: String(describing: tokenType))
    }
    
    static func get(_ tokenType: TokenType) -> String? {
        return UserDefaults.standard.string(forKey: String(describing: tokenType))
    }
    
        static func remove(_ tokenType: TokenType) {
        UserDefaults.standard.removeObject(forKey: String(describing: tokenType))
    }
}
