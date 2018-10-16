//
//  Device.swift
//  WheresMyPhone
//
//  Created by Dusan Juranovic on 8/31/18.
//  Copyright © 2018 Dusan Juranovic. All rights reserved.
//

import UIKit

struct DeviceLocation: Codable {
    
    var deviceName: String?
    
    var longitude: Double
    var latitude: Double
    var timestamp: Double
    var accuracy: Double
    
    init(longitude: Double, latitude: Double, timestamp: Double, accuracy: Double) {
        self.longitude = longitude
        self.latitude = latitude
        self.timestamp = timestamp
        self.accuracy = accuracy
    }

}

//MARK: - Convert our properties for sending to bytes

extension DeviceLocation {
    
    var data: Data {
        var data = Data()
        data.append(longitude.data)
        data.append(latitude.data)
        data.append(timestamp.data)
        data.append(accuracy.data)
        return data
    }
}



