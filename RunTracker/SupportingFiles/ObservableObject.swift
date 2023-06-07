//
//  ObservableObject.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 07.06.2023.
//

import Foundation

final class ObservableObject<T> {
    typealias Listener = (T) -> Void
    
    private var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
    }
}
