//
//  UserTableView.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 11/10/22.
//

import Foundation
import UIKit

class MainTableView: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  
  var photo = UIImage()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(TextFieldCell.self, forCellReuseIdentifier: "textFieldCell")
    tableView.register(ButtonCell.self, forCellReuseIdentifier: "buttonCell")
    tableView.register(TextCell.self, forCellReuseIdentifier: "textCell")
    tableView.register(GeneralCell.self, forCellReuseIdentifier: "generalCell")
    self.tableView.backgroundColor = setBackgroundApp()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as? TextFieldCell else {
        fatalError()
      }
      
      cell.setup()
      return cell
      
    case 1:
      
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as? ButtonCell else {
        fatalError()
      }
      
      if photo.size.width == 0 {
        cell.isHidden = true
        return cell
      }
      cell.setup(with: photo)
      
      return cell
      
    case 2:
      
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "generalCell", for: indexPath) as? GeneralCell else {
        fatalError()
      }
      cell.setup()
      return cell
      
    case 3:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as? TextCell else {
        fatalError()
      }
      
      cell.setup()
      return cell
      
    default:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "generalCell", for: indexPath) as? GeneralCell else {
        fatalError()
      }
      
      cell.setup()
      return cell
    }
  }
  
  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if photo.size.width == 0 && indexPath.row == 1 {
      return 0
    }
    return UITableView.automaticDimension
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 3 {
      let chartTableView = ChartTableView()
      self.navigationController?.pushViewController(chartTableView, animated: true)
    } else if indexPath.row == 2 {
      takePhoto()
    }
  }
  
  // TODO: Probar en un dispositivo fisico, en el simulador no se puede acceder a la camara
  func takePhoto() {
    print("take photo")
    let picker = UIImagePickerController()
    // picker.sourceType = .camera
    picker.sourceType = .photoLibrary
    picker.allowsEditing = true
    picker.delegate = self
    
    if !UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
      print("No se puede abrir la camara")
    } else {
      present(picker, animated: true, completion: nil)
    }
    
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    picker.dismiss(animated: true)
    
    guard let image = info[.editedImage] as? UIImage else {
      print("No image found")
      return
    }
    photo = image
    tableView.reloadData()
  }
  
}
