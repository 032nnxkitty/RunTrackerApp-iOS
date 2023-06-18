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
    dynamic var timeDurationSec: Int  = 0
    dynamic var meters:          Int  = 0
    dynamic var kcal:             Int  = 0
    dynamic var averageSpeed:    Int  = 0
    // dynamic var points: (Double, Double) = (0, 0) // ??
}
