//
//  TextCharactersExtension.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 11/10/22.
//

import UIKit

class TitleChartLabel: UILabel {
  
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
    self.numberOfLines = 0
    self.font = UIFont.titleChartFont
    self.textColor = UIColor.chartTitleColor
  }
}
