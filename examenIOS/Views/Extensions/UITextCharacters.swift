//
//  TextCharactersExtension.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 11/10/22.
//

import UIKit

class TextCharactersExtension: UITextField, UITextFieldDelegate {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    self.textAlignment = .left
    self.font = UIFont.textfieldFont
    self.textColor = UIColor.mainTextColor
    self.borderStyle = .roundedRect
    self.delegate = self
  }
  
  // TODO: Arreglar por que esta permitiendo simbolos como ´ / ^, etc
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    if string == " " { return true }
    if let _ = string.rangeOfCharacter(from: CharacterSet.letters) {
      return true
    }
    return false
    
  }
}
