//
//  Provider.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 18/10/2020.
//

import Foundation

protocol ProviderProtocol {
    func request<T>(type: T.Type, service: ServiceProtocol, completion: @escaping (NetworkResponse<T>) -> ()) where T: Decodable
}

