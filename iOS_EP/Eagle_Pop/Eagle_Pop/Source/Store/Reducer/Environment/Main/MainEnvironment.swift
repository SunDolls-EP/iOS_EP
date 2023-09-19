//
//  Environment.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/09/19.
//

import Foundation
import CombineSchedulers
import ComposableArchitecture

struct AppEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
}

struct ApiError: Error, Equatable { }
