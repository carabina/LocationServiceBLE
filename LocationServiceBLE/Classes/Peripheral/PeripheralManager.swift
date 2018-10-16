//
//  PeripheralManager.swift
//  FrameworkTest
//
//  Created by Marko Trajcevic on 10/12/18.
//  Copyright © 2018 Marko Trajcevic. All rights reserved.
//

import Foundation
import CoreBluetooth
import RxCocoa
import RxSwift

class PeripheralManager: NSObject {
    
    
    var manager: CBPeripheralManager?
    let config: Service?
    
    
    
override init() {
        config = Service()
        super.init()
        manager = CBPeripheralManager(delegate: self, queue: nil)
    
    }
    
    func createService() {
    }
    
}

extension PeripheralManager: CBPeripheralManagerDelegate {

    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        print(peripheral.state.debugDescription)
        if peripheral.state == .poweredOn {
            createService()
        }
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        print("PeripheralManager started advertising ")
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        print("Peripheral Manager: Central subscribed to characteristic")
//        sendData()
    }
    func peripheralManagerIsReady(toUpdateSubscribers peripheral: CBPeripheralManager) {
//        send some more data
//        sendData()
    }
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didUnsubscribeFrom characteristic: CBCharacteristic) {
        print("Central did unsubscribed from characteristic")
    }
    
    
}
