//
//  CustomARView.swift
//  ARKit Learn
//
//  Created by Nguyên Nguyễn on 2024-06-13.
//

import ARKit
import Combine
import RealityKit
import SwiftUI

class CustomARView: ARView {
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("Init coder error")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        
        subcribeToActionStream()
    }
    
    private var cancellables: Set<AnyCancellable> = []
    
    func subcribeToActionStream() {
        ARManager.shared
            .actionStream
            .sink { [weak self] action in
                switch action {
                    case .placeBlock(let color):
                        self?.placeBlock(ofColor: color)
                    
                    case .removeAllAnchors:
                        self?.scene.anchors.removeAll()
                    
                }
            }
            .store(in: &cancellables)
    }
    
    func configuration() {
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration)
    }
    
    func anchor() {
        let coorinatorAnchor = AnchorEntity(plane: .horizontal)
        scene.addAnchor(coorinatorAnchor)
    }
    
    func placeBlock(ofColor color: Color) {
        let block = MeshResource.generateBox(size: 1)
        let material = SimpleMaterial(color: UIColor(color), isMetallic: false)
        let entity = ModelEntity(mesh: block, materials: [material])
        
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(entity)
        
        scene.addAnchor(anchor)
        
    }
}
