//
//  MainModel.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/08.
//

import SwiftUI

protocol MainModelStateProtocol {
    var menuTitle: String { get }
}

protocol MainModelActionsProtocol: AnyObject {
    func selectDaily()
    
    func selectWeekly()
    
    func selectMonthly()
}

final class MainModel: ObservableObject, MainModelStateProtocol {
    @Published var menuTitle = "주간 랭킹"
}

extension MainModel: MainModelActionsProtocol {
    func selectDaily() {
        menuTitle = "일간"
    }
    func selectWeekly() {
        menuTitle = "주간"
    }
    func selectMonthly() {
        menuTitle = "월간"
    }
}
