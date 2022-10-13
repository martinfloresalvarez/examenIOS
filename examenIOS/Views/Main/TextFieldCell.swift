//
//  TextCell.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 11/10/22.
//

import UIKit

class TextFieldCell: UITableViewCell {
  
  let textTextFiel = TextCharactersExtension()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupLayouts()
  }
  
  private func setupViews() {
    contentView.addSubview(textTextFiel)
  }
  
  private func setupLayouts() {
    textTextFiel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      textTextFiel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      textTextFiel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      textTextFiel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      textTextFiel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
    ])
    
  }
  func setup() {
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
