//
//  RunSessionViewModel.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import Foundation

protocol RunSessionViewModel {
    var isUserInteractionEnabled: ObservableObject<Bool> { get set }
}

final class RunSessionViewModelImpl: RunSessionViewModel {
    var isUserInteractionEnabled: ObservableObject<Bool> = .init(value: true)
}
