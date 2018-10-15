//
//  DataConvertiable.swift
//  TestApp
//
//  Created by Marko Trajcevic on 10/3/18.
//  Copyright © 2018 Marko Trajcevic. All rights reserved.
//

import Foundation


protocol DataConvertiable {
    init?(data: Data)
    var data: Data { get }
}

// MARK: - Transforms Types that conforms to this protocol to its byte size

extension DataConvertiable {
    init?(data: Data){
        guard data.count == MemoryLayout<Self>.size else { return nil }
        self = data.withUnsafeBytes{ $0.pointee }
    }
    
    var data: Data {
        var value = self
        return Data(buffer: UnsafeBufferPointer(start: &value, count: 1))
    }
}

extension Int: DataConvertiable{}
extension Double: DataConvertiable {}
extension String: DataConvertiable {}


extension Data {
    /// Use this method to pop size of data from the beginning
    /// and transforming our previously data into new data without
    //  piece that we previously poped.
    //
    /// - Parameter amount: amount represents byte position from start
    // that we chose to pop until
    /// - Returns: return data with amount of bytes that we set in params
    mutating func pop(_ amount: Int ) -> Data {
        guard self.count >= amount else {
            return Data()
        }
        
        defer { self.removeSubrange(0..<amount) }
        return (self.subdata(in: 0..<amount))
    }
    /// Use this method for conversion if you are certian that next 8bytes in
    /// Data are type of Double
    /// - Returns: return value description
    init<T>(from value: T) {
        var value = value
        self.init(buffer: UnsafeBufferPointer(start: &value, count: 1))
    }
    
    func to<T>(type: T.Type) -> T {
        return self.withUnsafeBytes { $0.pointee }
    }
    
    /// This method uses custom method pop() which we previously implemented where
    /// we create [Data] with specific byte size that we pass on in parameter
    
    /// - Parameter num: number of bytes that we choose to pack in our [Data]
    /// - Returns: Array of data with size of num
    func chunked(bySize num: Int) -> [Data] {
        var tmp = self
        var size = tmp.count
        var dataArr = [Data]()
        
        while size != 0 {
            if size >= num {
                dataArr.append(tmp.pop(num))
                size -= num
            } else {
                dataArr.append(tmp.pop(size))
                break
            }
        }
        return dataArr
    }
}

