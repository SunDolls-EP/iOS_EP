//
//  TimePickerModel.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/11.
//

import Foundation


protocol TimePickerModelStateProtocol {
    
}

protocol TimePickerModelActionsProtocol: AnyObject {
}

final class TimePickerModel: ObservableObject, TimePickerModelStateProtocol {
      
}

extension TimePickerModel: TimePickerModelActionsProtocol {

}
