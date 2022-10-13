//
//  ChartView1.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 12/10/22.
//

import Foundation
import UIKit
import Charts
import SwiftUI

class ChartView: UITableViewCell, ChartViewDelegate {
  
  var pieChartView = PieChartView()
  var charts: [Charts] = []
  var titleLable = TitleChartLabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupLayouts()
    pieChartView.delegate = self
  }
  
  // TODO: crear una clase / metodo de configuracion
  // TODO: dividir las label al 50% en Mobil y Inline en Ipad

  func customizeChart(index: Int) {
    pieChartView.holeRadiusPercent = 0.85
    pieChartView.transparentCircleRadiusPercent = 0
    pieChartView.legend.enabled = true
    pieChartView.chartDescription?.enabled = false
    pieChartView.minOffset = 0
    pieChartView.drawEntryLabelsEnabled = false
    pieChartView.entryLabelColor = .clear
    pieChartView.drawCenterTextEnabled = false
    pieChartView.holeColor = nil
    pieChartView.frame.size = CGSize(width: 500, height: 300)
    
    let label = pieChartView.legend
    label.enabled = true
    label.orientation = .horizontal
    label.form = .circle
    label.formSize = CGFloat(12)
    label.maxSizePercent = 0.95
    label.xEntrySpace = 100
    label.yEntrySpace = 20
    
    var dataEntries: [ChartDataEntry] = []
    
    if index == 0 {
      for reporte in charts[0].reporte {
        let dataEntry = PieChartDataEntry(value: Double(reporte.cantidad) ?? 0, label: reporte.valor, data: reporte as AnyObject)
        dataEntries.append(dataEntry)
      }
    } else if index == 1 {
      for empresa in charts[0].empresas {
        let dataEntry = PieChartDataEntry(value: Double(empresa.porcentaje), label: empresa.nombre, data: empresa as AnyObject)
        dataEntries.append(dataEntry)
      }
    }
    
    let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
    
    pieChartDataSet.drawValuesEnabled = false
    if index == 0 {
      pieChartDataSet.colors = colorsOfCharts(numbersOfColor: charts[0].empresas.count)
    } else if index == 1 {
      pieChartDataSet.colors = colorsOfCharts(numbersOfColor: charts[0].reporte.count)
    }
    
    let pieChartData = PieChartData(dataSet: pieChartDataSet)
    let format = NumberFormatter()
    format.numberStyle = .none
    let formatter = DefaultValueFormatter(formatter: format)
    pieChartData.setValueFormatter(formatter)
    pieChartView.data = pieChartData
  }
  
  private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
    let colors: [UIColor] = [UIColor.chart1Color1, UIColor.chart1Color2, UIColor.chart2Color1, UIColor.chart2Color2, UIColor.chart2Color3, UIColor.chart2Color4]
    return colors
  }
  
  private func setupViews() {
    contentView.addSubview(titleLable)
    contentView.addSubview(pieChartView)
  }
  
  // TODO: Agregar constantes de diseño (margin)
  private func setupLayouts() {
    titleLable.translatesAutoresizingMaskIntoConstraints = false
    pieChartView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      titleLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      titleLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      titleLable.bottomAnchor.constraint(equalTo: pieChartView.topAnchor, constant: 0)
    ])
    
    // TODO: fixear puesto que las graficas no son de mismo tamaño en diferentes dispositivos
    NSLayoutConstraint.activate([
      pieChartView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      pieChartView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 0),
      pieChartView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      pieChartView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
      pieChartView.heightAnchor.constraint(equalToConstant: 400)
    ])
    
  }
  func setup(with charts: [Charts], title: String, index: Int) {
    self.charts = charts
    titleLable.text = title
    customizeChart(index: index)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
