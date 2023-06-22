//
//  RunsHistoryKeeper.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import Foundation
import RealmSwift

protocol RunsHistoryKeeper {
    func getAllRuns() -> [RunInfoModel]
    func getInfoForRun(at indexPath: IndexPath) -> RunInfoModel?
    func saveNewRun(_ model: RunInfoModel)
}

final class RealmManager {
    static let shared = RealmManager()
    var realmDB: Realm
    
    private init() {
        do {
            realmDB = try Realm()
        } catch {
            fatalError("Realm error: \(error.localizedDescription)")
        }
    }
}

// MARK: - RunsHistoryKeeper Protocol
extension RealmManager: RunsHistoryKeeper {
    func getAllRuns() -> [RunInfoModel] {
        return Array(realmDB.objects(RunInfoModel.self))
    }
    
    func getInfoForRun(at indexPath: IndexPath) -> RunInfoModel? {
        var allRuns = realmDB.objects(RunInfoModel.self)
        guard indexPath.row < allRuns.count else { return nil }
        return allRuns[indexPath.row]
    }
    
    func saveNewRun(_ model: RunInfoModel) {
        do {
            try realmDB.write {
                realmDB.add(model)
            }
        } catch {
            fatalError()
        }
    }
}
