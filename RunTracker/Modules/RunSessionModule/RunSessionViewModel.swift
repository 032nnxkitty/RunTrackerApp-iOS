//
//  RunSessionViewModel.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import Foundation
import CoreLocation

typealias RunSessionViewModel = RunSessionViewModelEventsHandling & RunSessionViewModelProperties

protocol RunSessionViewModelEventsHandling {
    func viewDidAppear()
    func pauseButtonDidTap()
    func finishSession()
}

protocol RunSessionViewModelProperties {
    var isUserInteractionEnabled: ObservableObject<Bool> { get }
    var isOnPause: ObservableObject<Bool> { get }
    var secondsDuration: ObservableObject<Int> { get }
    var newPathCoordinates: ObservableObject<[CLLocationCoordinate2D]> { get }
    var distanceMeters: ObservableObject<Int> { get }
    var kcal: ObservableObject<Double> { get }
    var avgPace: ObservableObject<Int> { get }
}

final class RunSessionViewModelImpl: NSObject, RunSessionViewModel {
    // MARK: - Private Properties
    private var timer: Timer?
    
    private let locationManager = CLLocationManager()
    
    private var previousCoordinate: CLLocationCoordinate2D?
    
    private var runningHistoryManager: RunningHistoryManager
    
    // MARK: - Init
    init(runningHistoryManager: RunningHistoryManager) {
        self.runningHistoryManager = runningHistoryManager
        super.init()
        configureLocationManager()
    }
    
    // MARK: - Public Properties
    var isUserInteractionEnabled: ObservableObject<Bool> = .init(value: true)
    
    var isOnPause: ObservableObject<Bool> = .init(value: false)
    
    var secondsDuration: ObservableObject<Int> = .init(value: 0)
    
    var newPathCoordinates: ObservableObject<[CLLocationCoordinate2D]> = .init(value: .init())
    
    var distanceMeters: ObservableObject<Int> = .init(value: 0)
    
    var kcal: ObservableObject<Double> = .init(value: 0)
    
    let avgPace: ObservableObject<Int> = .init(value: 0)
    
    // MARK: - Public Methods
    func viewDidAppear() {
        startTimer()
    }
    
    func pauseButtonDidTap() {
        isOnPause.value.toggle()
        isOnPause.value ? timer?.invalidate() : startTimer()
    }
    
    func finishSession() {
        timer?.invalidate()
        saveStats()
    }
}

// MARK: - Private Methods
private extension RunSessionViewModelImpl {
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self else { return }
            secondsDuration.value += 1
            
            // kcal: 1 running min = users weight in kg
            kcal.value += 80.0 / 60.0
            // update every 30 min
            guard secondsDuration.value % (60 * 30) == 0 else { return }
        }
    }
    
    func configureLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func saveStats() {
        let model = RunInfoModel()
        model.durationSec = secondsDuration.value
        model.distanceMeters
        model.kcal
        // fill model
        // save to realm
    }
}

// MARK: - CLLocationManagerDelegate
extension RunSessionViewModelImpl: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newCoordinate = locations.last?.coordinate else { return }
        
        if previousCoordinate == nil {
            previousCoordinate = newCoordinate
        }
        
        newPathCoordinates.value = [previousCoordinate!, newCoordinate]
        
        let newLocation = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
        let prevLocation = CLLocation(latitude: previousCoordinate!.latitude, longitude: previousCoordinate!.longitude)
        let oldDistance = distanceMeters.value
        let newDistance = newLocation.distance(from: prevLocation)
        distanceMeters.value = oldDistance + Int(newDistance)
        
        
        
        // save coordinates to show users path
        previousCoordinate = newCoordinate
    }
}
