//
//  Currency.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 25/10/2020.
//

import Foundation


struct Currency{
    let key : String
    let value : Int
    let name :  String
    
    init(_key:String,_value:Int,_name:String){
       key = _key
       value = _value
       name = _name
    }
}
