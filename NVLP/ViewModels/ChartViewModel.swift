//
//  ChartViewModel.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 25/10/2020.
//

import Foundation
import SwiftyJSON

class ChartViewModel {
    
    public var currentData : [Currency] = []
    public var previousData : [Currency] = []
    public var currencyChanges : [String:Int] = [:]
    
    init(){
        registerForNotifications()
    }
    
    fileprivate func registerForNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateData(notification:)), name: Notification.Name("updateData"), object: nil)
        }
    
   
    @objc func updateData(notification:Notification){
        var value = Int()
        var name  = String()
        var key = String()
        if let dic = notification.object as? JSON{
            previousData = currentData
            currentData.removeAll()
            if let array = dic.arrayObject as? [[String : Any]]{
                print("31.array=\(array)")
                array.forEach { (obj) in
                    if let _value = obj["value"] as? Int{
                        value = _value
                    }
                
                    if let _name = obj["name"] as? String{
                        name = _name
                    }
                    
                    if let _key = obj["key"] as? String{
                        key = _key
                    }
                    let currency = Currency(_key: key, _value: value, _name: name)
                    currentData.append(currency)
            }
                if previousData.isEmpty{
                    previousData = currentData
                }
                currencyChanges = calculateChange(with: previousData, and: currentData)
        }
            print("1.current=\(currentData)")
            print("2.previous=\(previousData)")
            print("3.change=\(currencyChanges)")
            print("1.current.count=\(currentData.count)")
            print("2.previous.count=\(previousData.count)")
            print("3.change.count=\(currencyChanges.count)")
            
        }}
    
    func calculateChange(with previous:[Currency], and current:[Currency])->[String:Int]{
            var outputChanges : [String: Int] = [:]
            for index in current.indices{
                let i = current[index].value
                let k = current[index].key
                var c = Int()
                
                previous.forEach { (currency) in
                    if currency.key == k{
                        c = i - currency.value
                    }
                    
                }
               
                let name = current[index].name
                outputChanges[name] = c
            }
             return outputChanges
        }
 
}



