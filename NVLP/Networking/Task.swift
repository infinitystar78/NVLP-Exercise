//
//  Task.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 18/10/2020.
//

import Foundation

typealias Parameters = [String: Any]

enum Task {
    case requestPlain
    case requestParameters(Parameters)
}
