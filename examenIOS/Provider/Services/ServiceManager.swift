//
//  ServiceManager.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 11/10/22.
//

import Foundation
import Alamofire

class ServiceManager {
  
  public static let shared = ServiceManager()
  let idioma = langApp()
  
  func callService<T: Codable>(urlString: String, parameters: [String: Any], success: @escaping ((T) -> Void), fail: @escaping(() -> Void)) {
    
    var animDictionary: [String: Any] = [:]
    animDictionary["idioma"] = idioma
    animDictionary.merge(parameters) {(current, _ ) in current}
    
    AF.request(urlString, method: .get, parameters: animDictionary).responseDecodable(decoder: JSONDecoder()) { (response: DataResponse<T, AFError>) in
      if let data = response.data {
        
        do {
          if let jsonString = String(data: data, encoding: .utf8) {
            print("success \(jsonString)")
          }
          let decoded = try JSONDecoder().decode(T.self, from: data)
          success(decoded)
        } catch {
          print("Error al decodificar JSON \(String(describing: error))")
          fail()
        }
      }
    }
  }
}

class Connectivity {
  class func isOnline() -> Bool {
    print("estado \(NetworkReachabilityManager()!.isReachable)")
    return NetworkReachabilityManager()!.isReachable
  }
}
