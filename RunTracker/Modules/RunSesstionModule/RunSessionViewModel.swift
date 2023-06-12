//
//  RunSessionViewModel.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import Foundation
import CoreLocation

typealias RunSessionViewModel = RunSessionProperties && RunSessionEventsHandling

protocol RunSessionEventsHandling {
    func viewDidAppear()
    func pauseButtonDidTap()
    func finishSession()
}

protocol RunSessionProperties {
    var isUserInteractionEnabled: ObservableObject<Bool> { get set }
    var isOnPause: ObservableObject<Bool> { get set }
    var secondsDuration: ObservableObject<Int> { get set }
    var newPathCoordinates: ObservableObject<[CLLocationCoordinate2D]> { get set }
}

final class RunSessionViewModelImpl: NSObject, RunSessionViewModel {
    // MARK: - Private Properties
    private var timer: Timer?
    private let locationManager = CLLocationManager()
    private var previousCoordinate: CLLocationCoordinate2D?
    private var runHistoryKeeper: RunsHistoryKeeper
    
    // MARK: - Init
    init(runHistoryKeeper: RunsHistoryKeeper) {
        super.init()
        self.runHistoryKeeper = runHistoryKeeper
        configureLocationManager()
    }
    
    // MARK: - Public Properties & Methods
    var isUserInteractionEnabled: ObservableObject<Bool> = .init(value: true)
    var isOnPause: ObservableObject<Bool> = .init(value: false)
    var secondsDuration: ObservableObject<Int> = .init(value: 0)
    
    var newPathCoordinates: ObservableObject<[CLLocationCoordinate2D]> = .init(value: .init())
    
    func viewDidAppear() {
        startTimer()
    }
    
    func pauseButtonDidTap() {
        isOnPause.value.toggle()
        isOnPause.value ? timer?.invalidate() : startTimer()
    }
    
    func finishSession() {
        timer?.invalidate()
        
        // duration
        // distance
        // kcal
        // save to realm
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
        locationManager.startUpdatingLocation()
    }
}

// MARK: - CLLocationManagerDelegate
extension RunSessionViewModelImpl: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newCoordinate = locations.last?.coordinate else { return }
        newPathCoordinates.value = [previousCoordinate ?? newCoordinate, newCoordinate]
        previousCoordinate = newCoordinate
    }
}
