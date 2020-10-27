//
//  ChartViewController.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 25/10/2020.
//

import Foundation
import UIKit
import KRProgressHUD
import Charts



class ChartViewController : UIViewController{
    
    public var chartModel = ChartViewModel()
    private let sse = SSEConnection()

    @IBOutlet weak var currencyParentView: UIView!
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var currency_1: CurrencyLabel!
    @IBOutlet weak var currency_1_change: UILabel!
    @IBOutlet weak var currency_2: CurrencyLabel!
    @IBOutlet weak var currency_2_change: UILabel!
    @IBOutlet weak var currency_3: CurrencyLabel!
    @IBOutlet weak var currency_3_change: UILabel!
    @IBOutlet weak var currency_4: CurrencyLabel!
    @IBOutlet weak var currency_4_change: UILabel!
    @IBOutlet weak var currency_5: CurrencyLabel!
    @IBOutlet weak var currency_5_change: UILabel!
    @IBOutlet weak var currency_6: CurrencyLabel!
    @IBOutlet weak var currency_6_change: UILabel!
    @IBOutlet weak var currency_7: CurrencyLabel!
    @IBOutlet weak var currency_7_change: UILabel!
    @IBOutlet weak var currency_8: CurrencyLabel!
    @IBOutlet weak var currency_8_change: UILabel!
    
    
    override func viewDidLoad() {
        self.connectToServer()
        currencyParentView.addShadowToViewWithCornerRadius()
    }
    
    
    func connectToServer(){
        DispatchQueue.main.async {
            KRProgressHUD.show()
        }
        self.sse.connectToEventSource { (success) in
            if success == true{
                DispatchQueue.main.async {
                   KRProgressHUD.dismiss()
                    UIView.animate(withDuration: 0.3) { [weak self] in
                        self?.updateChart()

                    }
                    
                }
            }
        }
        
    }
    
    func updateChart(){
        var chartData : [BarChartDataEntry] = []
        let labels  = [currency_1,
                       currency_2,
                       currency_3,
                       currency_4,
                       currency_5,
                       currency_6,
                       currency_7,
                       currency_8]
        
        let changelabels = [currency_1_change,
                            currency_2_change,
                            currency_3_change,
                            currency_4_change,
                            currency_5_change,
                            currency_6_change,
                            currency_7_change,
                            currency_8_change
        ]
        
        let currencyLabels = ["BTC", "ETH", "LTE" ,"RPL" ,"PLN" ,"USD" ,"EUR", "THB"]
        
        for i in 0..<labels.count{
            let text = currencyLabels[i]
            labels[i]?.text = text
        }

        let current = chartModel.currentData
        let changes = chartModel.currencyChanges
        
        for i in 0..<changelabels.count{
            changelabels[i]?.textAlignment = .center
            let text = currencyLabels[i]
            changes.forEach { (changesDictionary) in
                if text == changesDictionary.key{
                    let value = changesDictionary.value
                    if value < 0 {
                        changelabels[i]?.textColor = .red
                    }
                    
                    if value > 0{
                        changelabels[i]?.textColor = .green
                    }
                    
                    changelabels[i]?.text = String(value)
                }
            }
        }
        
        
        for i in 0..<labels.count{
            let text = currencyLabels[i]
            labels[i]?.text = text
        }
        
        
        for i in 0..<current.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(current[i].value))
            chartData.append(dataEntry)
        }
        let dataSet = BarChartDataSet(entries: chartData, label: "Latest Prices")
        dataSet.colors = ChartColorTemplates.liberty()
        let barChartData = BarChartData(dataSet: dataSet)
        self.barChartView.xAxis.valueFormatter =  IndexAxisValueFormatter(values: currencyLabels)
        self.barChartView.data = barChartData

    }
    
}
