//
//  UserDefaults.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 11/10/22.
//

import Foundation

extension UserDefaults {
  
  func setBackgroundApp(value: String) {
    set(value, forKey: "backgroundapp")
  }
  func getBackgroundApp() -> String {
    return string(forKey: "backgroundapp")!
  }
  func isKeyPresentInUserDefaults(key: String) -> Bool {
    return UserDefaults.standard.object(forKey: key) != nil
  }
}
