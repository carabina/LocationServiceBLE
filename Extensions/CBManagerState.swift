//
//  CBManagerState.swift
//  FrameworkTest
//
//  Created by Marko Trajcevic on 10/12/18.
//  Copyright © 2018 Marko Trajcevic. All rights reserved.
//

import CoreBluetooth

@available(iOS 10.0, *)
extension CBManagerState: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .unknown:
            return "State unknown, update imminent."
        case .resetting:
            return "The connection with the system service was momentarily lost, update imminent."
        case .unsupported:
            return "The platform doesn't support the Bluetooth Low Energy Central/Client role."
        case .unauthorized:
            return "The application is not authorized to use the Bluetooth Low Energy role."
        case .poweredOff:
            return "Bluetooth is currently powered off."
        case .poweredOn:
            return "Bluetooth is currently powered on and available to use."
            }
        }
}
