//
//  NetworkResponse.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 18/10/2020.
//

import Foundation

enum NetworkResponse<T> {
    case success(T)
    case failure(NetworkError)
}
