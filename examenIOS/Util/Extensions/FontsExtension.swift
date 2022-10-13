//
//  UIFont.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 11/10/22.
//

import Foundation
import UIKit

extension UIFont {
  static var titleChartFont: UIFont {
    UIFont.systemFont(ofSize: 24, weight: .regular)
  }
  static var textfieldFont: UIFont {
    UIFont.systemFont(ofSize: 22, weight: .medium)
  }
  static var textFont: UIFont {
    UIFont.systemFont(ofSize: 18, weight: .light)
  }
  static var buttonActionFont: UIFont {
    UIFont.systemFont(ofSize: 16, weight: .bold)
  }
}
