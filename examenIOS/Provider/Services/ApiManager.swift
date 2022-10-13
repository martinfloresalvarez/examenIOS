//
//  ApiManager.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 11/10/22.
//

import Foundation

class ApiManager {
  public static let shared = ApiManager()
  
  func getChartData(parameters: [String: Any], success: @escaping ((Charts) -> Void), fail: @escaping (() -> Void)) {
    ServiceManager.shared.callService(urlString: Constants.urlApi, parameters: parameters) { (response: Charts) in success(response)
    } fail: {
      fail()
    }
  }
}
