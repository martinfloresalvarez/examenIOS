//
//  descriptionCell.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 11/10/22.
//

import Foundation
import UIKit

class TextCell: UITableViewCell {
  
  let text = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupLayouts()
  }
  
  private func setupViews() {
    contentView.addSubview(text)
  }
  
  private func setupLayouts() {
    text.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      text.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      text.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      text.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
    ])
    
  }
  
  // TODO: separar y crear una fuente de datos para el texto
  func setup() {
    text.numberOfLines = 0
    text.text = "Una gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental)."
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
