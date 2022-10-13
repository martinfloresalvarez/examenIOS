//
//  ChartView.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 11/10/22.
//

import Foundation
import UIKit

class ChartTableView: UITableViewController {
  
  var charts: [Charts] = []
  var titles = ["¿Estaba limpia la sucursal?", "¿Qué empresas cuentan con medidas de seguridad?"]
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(ChartView.self, forCellReuseIdentifier: "ChartView")
    tableView.separatorStyle = .none
    
    loadData()
  }
  
  func loadData() {
    let parameters: [String: Any] = ["": ""]
    
    DispatchQueue.main.async {
      
      ApiManager.shared.getChartData(parameters: parameters) { (response) in
        self.charts = [response]
        self.tableView.reloadData()
        
      } fail: {
        print("fail")
      }
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.backgroundColor = setBackgroundApp()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChartView", for: indexPath) as? ChartView else {
      fatalError()
    }
    if charts.count >= 1 {
      cell.backgroundColor = UIColor.clear
      cell.setup(with: charts, title: titles[indexPath.row], index: indexPath.row)
    }
    cell.selectionStyle = .none
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }
}
