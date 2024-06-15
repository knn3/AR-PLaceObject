//
//  ARViewRepresentable.swift
//  ARKit Learn
//
//  Created by Nguyên Nguyễn on 2024-06-13.
//

import SwiftUI

struct ARViewRepresentable: UIViewRepresentable{
    func makeUIView(context: Context) -> CustomARView {
        return CustomARView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
