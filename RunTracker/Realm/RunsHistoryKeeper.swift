//
//  RunsHistoryKeeper.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import Foundation
import RealmSwift

protocol RunsHistoryKeeper {
    
}

final class RealmManager {
    static let shared = RealmManager()
    var realmDB: Realm
    
    private init() {
        do {
            try self.realmDB = Realm()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

// MARK: - RunsHistoryKeeper Protocol
extension RealmManager: RunsHistoryKeeper {
    
}
