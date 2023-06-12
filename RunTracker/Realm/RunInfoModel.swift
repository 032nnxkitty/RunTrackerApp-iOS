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
    dynamic var stepsCount:      Int  = 0
    dynamic var timeDurationSec: Int  = 0
    dynamic var meters:          Int  = 0
    dynamic var cal:             Int  = 0
    dynamic var date:            Date = .init()
    dynamic var averageSpeed:    Int  = 0
    // dynamic var points: (Double, Double) = (0, 0) // ??
}
