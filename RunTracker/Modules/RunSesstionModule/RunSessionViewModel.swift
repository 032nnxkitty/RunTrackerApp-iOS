//
//  RunSessionViewModel.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import Foundation
import CoreLocation

protocol RunSessionViewModel {
    var isUserInteractionEnabled: ObservableObject<Bool> { get set }
    var isOnPause: ObservableObject<Bool> { get set }
    var secondsDuration: ObservableObject<Int> { get set }
    
    func viewDidAppear()
    func pauseButtonDidTap()
}

final class RunSessionViewModelImpl: NSObject, RunSessionViewModel {
    // MARK: - Private Properties
    private var timer: Timer?
    private let locationManager = CLLocationManager()
    
    // MARK: - Init
    override init() {
        super.init()
        configureLocationManager()
    }
    
    // MARK: - Public Properties & Methods
    var isUserInteractionEnabled: ObservableObject<Bool> = .init(value: true)
    var isOnPause: ObservableObject<Bool> = .init(value: false)
    var secondsDuration: ObservableObject<Int> = .init(value: 0)
    
    func viewDidAppear() {
        startTimer()
    }
    
    func pauseButtonDidTap() {
        isOnPause.value.toggle()
        isOnPause.value ? timer?.invalidate() : startTimer()
    }
}

// MARK: - Private Methods
private extension RunSessionViewModelImpl {
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self else { return }
            secondsDuration.value += 1
        }
    }
    
    func configureLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
}

// MARK: - CLLocationManagerDelegate
extension RunSessionViewModelImpl: CLLocationManagerDelegate {
    
}
