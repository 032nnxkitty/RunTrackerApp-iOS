//
//  RunInfoModel.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import Foundation
import RealmSwift

@objcMembers
class RunInfoModel: Object {
    dynamic var id:              UUID = .init()
    dynamic var date:            Date = .init()
    dynamic var durationSec:     Int  = 0
    dynamic var distanceMeters:  Int  = 0
    dynamic var kcal:            Int  = 0
    dynamic var averageSpeed:    Int  = 0
    // dynamic var path: [(Double, Double)] = []
}
