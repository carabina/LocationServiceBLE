//
//  PeripheralSendPackage.swift
//  TestApp
//
//  Created by Marko Trajcevic on 10/9/18.
//  Copyright © 2018 Marko Trajcevic. All rights reserved.
//

import Foundation

struct PackageQueue {
    
    var packages: [Data]
    var packageCounter: Int
    var packIndex: Int = 0
    
    init(packageData: Data, chunkSize: Int) {
        packages = packageData.chunked(bySize: chunkSize)
        packageCounter = packages.count
    }
    
    
    mutating func getNext() -> Data? {
        guard packIndex != packageCounter else {return nil}
        let current = packages[packIndex]
        return current
    }
    
    
    var currentPack: Data? {
        guard packIndex != 0 else { return nil }
        return packages[packIndex-1]
    }
}
