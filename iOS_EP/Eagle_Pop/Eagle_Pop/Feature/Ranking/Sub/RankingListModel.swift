//
//  RankingListModel.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/3/23.
//

import UIKit

struct PersonalRankingInfo: Hashable, Identifiable {
    let id = UUID()
    let rank: Int
    let name: String
    let group: String
    let studyTime: String
}

struct PersonalRankingArray: Hashable,Identifiable {
    let title: String
    let personalRankingInfo: [PersonalRankingInfo]
    let id = UUID()
}


struct GroupRankingInfo: Hashable, Identifiable {
    let id = UUID()
    let rank: Int
    let groupName: String
    let studyTime: String
}

struct GroupRankingArray: Hashable,Identifiable {
    let id = UUID()
    let title: String
    let groupRankingInfo: [GroupRankingInfo]
}

