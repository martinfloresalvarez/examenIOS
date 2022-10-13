//
//  GeneralCell.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 11/10/22.
//

import Foundation
import UIKit

class GeneralCell: UITableViewCell {
  
  let generalText = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupLayouts()
  }
  
  private func setupViews() {
    
    contentView.addSubview(generalText)
  }
  
  private func setupLayouts() {
    generalText.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      generalText.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
      generalText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0)
    ])
    
  }
  func setup() {
    generalText.text = "Take photo"
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
