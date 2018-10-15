import UIKit
import CoreBluetooth


struct UUID {
    
    public let service_uuid: CBUUID
    public let liveLocation_characteristic_uuid: CBUUID
    public let dateRange_characteristic_uuid: CBUUID
    public let transferLocations_characteristic_uuid: CBUUID
    
    init(service: String = "BBB8A535-BCDF-4838-858A-74A344F960F2",
         liveLocation: String = "0A0AFE6C-3D0C-4617-9174-7489FB22C01E",
         dateRange: String = "7897A8E7-336B-4A3A-9559-B4FEA0D5F0DF",
         transferLocation: String = "BFAC5F31-07EB-44D2-9FF6-A8ADDF4836EC") {
        service_uuid = CBUUID(string: service)
        liveLocation_characteristic_uuid = CBUUID(string: liveLocation)
        dateRange_characteristic_uuid = CBUUID(string: transferLocation)
        transferLocations_characteristic_uuid = CBUUID(string: transferLocation)
    }
}

struct Service {
    
    let uuids: UUID
    let cbService: CBMutableService
    let MTU: Int
    let characteristics: Characteristic
    
    init(uuid: UUID = UUID(),
         isPrimaryService: Bool = true,
         limit: Int = 20,
         char: Characteristic = Characteristic()) {
        uuids = uuid
        cbService = CBMutableService(type: uuid.service_uuid, primary: isPrimaryService)
        MTU = limit
        characteristics = char
    }
}

struct Characteristic {
    
    let liveLocation: CBMutableCharacteristic
    let dateRange: CBMutableCharacteristic
    let transferLocation: CBMutableCharacteristic
    
    let all: [CBMutableCharacteristic]
    
    init(uuid: UUID = UUID()) {
        liveLocation = CBMutableCharacteristic(type: uuid.liveLocation_characteristic_uuid, properties: .notify, value: nil, permissions: .readable)
        dateRange = CBMutableCharacteristic(type: uuid.dateRange_characteristic_uuid, properties: .write, value: nil, permissions: .writeable)
        transferLocation = CBMutableCharacteristic(type: uuid.transferLocations_characteristic_uuid, properties: .read, value: nil, permissions: .readable)
        
        all = [liveLocation, dateRange, transferLocation]
    }
}

