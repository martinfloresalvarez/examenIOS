//
//  Charts.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 11/10/22.
//

import Foundation

struct Charts: Codable {
  var reporte: [Reporte]
  var empresas: [Empresa]
}
struct Reporte: Codable {
  let valor: String
  let cantidad: String
}
struct Empresa: Codable {
  let nombre: String
  let porcentaje: Int
}
