//
//  AppInfo.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/5/23.
//

import Foundation

struct AppInfo: Hashable, Identifiable {
    let id = UUID()
    let image: String
    let title: String
}

struct AppInfoArray: Hashable,Identifiable {
    let id = UUID()
    let appInfo: [AppInfo]
}

