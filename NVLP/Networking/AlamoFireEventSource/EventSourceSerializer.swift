//
//  EventSourceSerializer.swift
//  AlamofireEventSource
//
//  Created by Daniel Clelland on 7/08/20.
//

import Foundation
import Alamofire
import SwiftyJSON
import Combine

public class EventSourceSerializer: DataStreamSerializer {
    
    public static let doubleNewlineDelimiter = "\n".data(using: .utf8)!
    
    public let delimiter: Data
    
    private var buffer = Data()
    
    public init(delimiter: Data = doubleNewlineDelimiter) {
        self.delimiter = delimiter
    }
    
    public func serialize(_ data: Data) throws -> [EventSourceMessage] {
        buffer.append(data)
        let str = String(decoding: data, as: UTF8.self)
        let json = JSON.init(parseJSON:str)
        let dic = ["JSON":json]
        print("30.json=\(json)")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateData"), object:json, userInfo: dic as [AnyHashable : Any])
        return extractMessagesFromBuffer().compactMap(EventSourceMessage.init(parsing:))
    }

    private func extractMessagesFromBuffer() -> [String] {
        var messages = [String]()
        var searchRange: Range<Data.Index> = buffer.startIndex..<buffer.endIndex
        
        while let delimiterRange = buffer.range(of: delimiter, in: searchRange) {
            let subdata = buffer.subdata(in: searchRange.startIndex..<delimiterRange.endIndex)

            if let message = String(bytes: subdata, encoding: .utf8) {
                messages.append(message)
            }

            searchRange = delimiterRange.endIndex..<buffer.endIndex
        }

        buffer.removeSubrange(buffer.startIndex..<searchRange.startIndex)

        return messages
    }
    
}
