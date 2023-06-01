//
//  RunInfoModel.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import Foundation
import RealmSwift

class RunInfoModel: Object {
    @objc dynamic var stepsCount:      Int    = 0
    @objc dynamic var timeDurationSec: Int    = 0
    @objc dynamic var km:              Double = 0
    @objc dynamic var cal:             Int    = 0
    @objc dynamic var date:            Date   = .init()
    @objc dynamic var averageSpeed:    Int    = 0
    //@objc dynamic var points: (Double, Double) = (0, 0) // ??
}
