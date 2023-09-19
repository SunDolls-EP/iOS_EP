//
//  TimePickerModel.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/11.
//

import Foundation


protocol TimerModelStateProtocol {
    
}

protocol TimerModelActionsProtocol: AnyObject {
}

final class TimerModel: ObservableObject, TimerModelStateProtocol {
      
}

extension TimerModel: TimerModelActionsProtocol {

}
