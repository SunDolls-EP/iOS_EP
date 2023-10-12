//
//  SerchListModel.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/5/23.
//

import Foundation
 
struct SerchListInfo: Hashable, Identifiable {
    let id = UUID()
    let rank: Int
    let image: String
    let name: String
    let groupName: String
}

struct SerchListArray: Hashable,Identifiable {
    let id = UUID()
    let serchListInfo: [SerchListInfo]
}
