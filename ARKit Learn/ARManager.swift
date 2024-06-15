//
//  ARManager.swift
//  ARKit Learn
//
//  Created by Nguyên Nguyễn on 2024-06-14.
//

import Combine

class ARManager {
    static let shared = ARManager()
    private init() { }

    var actionStream = PassthroughSubject<ARAction, Never>()
}
