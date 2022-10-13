//
//  RootView.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 11/10/22.
//
import Foundation
import UIKit
import FirebaseDatabase

class RootView: UINavigationController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // TODO: fixear este codigo, el background se cambia posterior al navigation view, obtengo el exadecimal correctamente pero el viewcontroller no alcanza a extraer el nuevo valor. agregar un observer
    var ref: DatabaseReference!
    ref = Database.database().reference()
    ref.child("background/").observeSingleEvent(of: .value, with: { snapshot in
      let color = snapshot.value as? String ?? "Unknown"
      print("color \(color)")
      UserDefaults.standard.setBackgroundApp(value: color)
    }) { error in
      print(error.localizedDescription)
    }
    let mainTableView = MainTableView()
    let navigationController = self
    navigationController.setViewControllers([mainTableView], animated: false)
    
  }
}
