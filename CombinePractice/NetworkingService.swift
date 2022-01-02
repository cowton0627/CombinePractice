//
//  NetworkingService.swift
//  CombinePractice
//
//  Created by Chun-Li Cheng on 2021/12/28.
//

import Combine
import Foundation

enum NetworkingService {
    static func getAnimals() -> Future<[Animal], Error> {
        return Future { promise in
            let animals: [Animal] = [.dog, .cat, .frog, .panda, .lion]
            promise(.success(animals))
        }
    }
}
