//
//  RunSessionViewModel.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import Foundation

protocol RunSessionViewModel {
    var isUserInteractionEnabled: ObservableObject<Bool> { get set }
    func viewDidAppear()
}

final class RunSessionViewModelImpl: RunSessionViewModel {
    // MARK: - Private Properties
    
    // MARK: - Public Properties & Methods
    var isUserInteractionEnabled: ObservableObject<Bool> = .init(value: true)
    
    func viewDidAppear() {
        
    }
}
