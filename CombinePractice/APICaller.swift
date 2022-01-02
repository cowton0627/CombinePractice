//
//  APICaller.swift
//  CombinePractice
//
//  Created by Chun-Li Cheng on 2021/12/28.
//

import Combine
import Foundation

class APICaller {
    static let shared = APICaller()
    
    func fetchCompanies() -> Future<[String], Error> {
        return Future { promixe in
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                promixe(.success(["Apple", "Google", "Microsoft", "Facebook"]))
            }
        }
    }
    
    
}
