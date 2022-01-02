//
//  AlertService.swift
//  CombinePractice
//
//  Created by Chun-Li Cheng on 2021/12/28.
//

import Foundation
import UIKit

enum AlertService {
    static func showAlert(with message: String, in viewController: UIViewController?) {
           let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
           alert.addAction(
               .init(title: "OK", style: .cancel)
           )
           viewController?.present(alert, animated: true)
       }
}
