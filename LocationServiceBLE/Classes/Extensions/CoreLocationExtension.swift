//
//  CoreLocationExtension.swift
//  WheresMyPhone
//
//  Created by Marko Trajcevic on 9/12/18.
//  Copyright © 2018 Dusan Juranovic. All rights reserved.
//
import UIKit
import CoreLocation

extension CLLocation {
    func toModel() -> DeviceLocation {
        return DeviceLocation(longitude: self.coordinate.longitude,
            latitude: self.coordinate.latitude,
            timestamp: self.timestamp.timeIntervalSince1970,
            accuracy: self.horizontalAccuracy)
    }
}
